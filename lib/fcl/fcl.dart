import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flow_dart_sdk/fcl/constants.dart';
import 'package:flow_dart_sdk/fcl/crypto.dart';
import 'package:flow_dart_sdk/fcl/encode.dart';

// Local utilities
import 'package:flow_dart_sdk/fcl/format.dart';
import 'package:flow_dart_sdk/fcl/types.dart';
import 'package:flow_dart_sdk/src/cadenceUtils.dart';

// Flow protobuf
import 'package:flow_dart_sdk/src/generated/flow/access/access.pbgrpc.dart';
import 'package:flow_dart_sdk/src/generated/flow/entities/transaction.pb.dart';
import 'package:flow_dart_sdk/wallet/wallet_provider.dart';
import 'package:flow_dart_sdk/wallet/wallet_utils.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:rlp/rlp.dart';

class FlowClient {
  String _appTitle;
  String _appUrl;
  WalletProvider _walletProvider;

  String _accessNode;
  int _port;
  ClientChannelBase _channel;

  AccessAPIClient? accessClient;

  static const String MOBILE_EMULATOR_ENDPOINT = '10.0.2.2';
  static const int FLOW_EMULATOR_PORT = 3569;

  FlowClient(this._accessNode, this._port, this._appTitle, this._appUrl, this._walletProvider)
      : this._channel = ClientChannel(
          _accessNode,
          port: _port,
          options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
        );

  Future<void> authenticate() async {
    await WalletUtils.performHttpRequest(_walletProvider.endpoint);
  }

  AccessAPIClient getAccessClient() {
    if (accessClient == null) {
      this.accessClient =
          AccessAPIClient(this._channel, options: CallOptions(timeout: Duration(seconds: 2)));
    }
    return this.accessClient!;
  }

  Future<AccountResponse> getAccount(String address, {Int64? height}) async {
    /* TODO: Implement at later stage
    var blockHeight = height;
    if (height == null) {
      blockHeight = await this.getBlockHeight();
    }


    final request = GetAccountAtBlockHeightRequest()
      ..blockHeight = blockHeight
      ..address = hex.decode(address);

     */
    final request = GetAccountAtLatestBlockRequest()..address = hex.decode(address);
    return this.getAccessClient().getAccountAtLatestBlock(request);
  }

  /// Gets account FLOW balance as string.
  Future<String> getAccountBalance(String address) async {
    final account = (await this.getAccount(address)).account;
    return formatUFix64(account.balance);
  }

  /// Gets block at specified [height] or latest available.
  Future<BlockResponse> getBlock({Int64? height}) {
    final client = this.getAccessClient();
    if (height == null) {
      return client.getLatestBlock(GetLatestBlockRequest());
    }

    final blockRequest = GetBlockByHeightRequest()..height = height;

    return client.getBlockByHeight(blockRequest);
  }

  /// Gets height of latest available block.
  Future<Int64> getBlockHeight() async {
    final response = await this.getBlock();
    return response.block.height;
  }

  /// Executes [code][ script at specified [height] or [blockId].
  Future<ExecuteScriptResponse> executeScript(String code,
      {List<CadenceValue>? arguments, Int64? height, List<int>? blockId}) async {
    final client = this.getAccessClient();

    final args = prepareArguments(arguments);

    // If blockId is specified, we shall execute it there
    if (blockId != null) {
      final request = ExecuteScriptAtBlockIDRequest()
        ..blockId = blockId
        ..script = utf8.encode(code);
      request.arguments.insertAll(0, args);

      return client.executeScriptAtBlockID(request);
    }

    // If height is not specified, we shall use current block height
    var blockHeight = height ?? await this.getBlockHeight();

    final request = ExecuteScriptAtBlockHeightRequest()
      ..blockHeight = blockHeight
      ..script = utf8.encode(code);

    request.arguments.insertAll(0, args);

    return client.executeScriptAtBlockHeight(request);
  }

  Future<void> sendTransaction2(String code) async {
    final client = this.getAccessClient();

    final t = Transaction();

    final request = SendTransactionRequest(transaction: t);

    client.sendTransaction(request);
  }

  /// Submits transaction to network.
  Future<SendTransactionResponse> sendTransaction(String code,
      {List<CadenceValue>? arguments, Int64? gasLimit}) async {
    final client = this.getAccessClient();

    // Convert arguments to required format
    final args = prepareArguments(arguments);

    final fixedGasLimit = gasLimit ?? Int64(100);

    final latestBlock = await this.getBlock();

    final privateKey = SERVICE_ACCOUNT_PRIVATE_KEY;
    final payerAddress = SERVICE_ACCOUNT;
    final payer = hex.decode(payerAddress);

    final accountResponse = await this.getAccount(payerAddress);
    final account = accountResponse.account;
    final keyId = 0;
    final sequenceNumber = account.keys[keyId].sequenceNumber;

    final proposalKey = Transaction_ProposalKey()
      ..address = payer
      ..sequenceNumber = Int64(sequenceNumber)
      ..keyId = keyId;

    // Prepare Transaction
    final transaction = Transaction()
      ..payer = payer
      ..script = utf8.encode(code)
      ..referenceBlockId = latestBlock.block.id
      ..proposalKey = proposalKey
      ..gasLimit = fixedGasLimit;

    transaction.arguments.insertAll(0, args);
    transaction.authorizers.insertAll(0, [payer]);

    // Signing
    final payload = transactionPayload(transaction);
    final rlpPayload = Rlp.encode(payload);
    var payloadSignatures = [];

    // Sign payload
    // Proposer
    signPayload(transaction, rlpPayload, transaction.proposalKey.address, privateKey, keyId,
        payloadSignatures);
    // Payer
    signPayload(transaction, rlpPayload, payer, privateKey, keyId, payloadSignatures);

    // Authorizers
    transaction.authorizers.forEach((authorizer) {
      signPayload(transaction, rlpPayload, authorizer, privateKey, keyId, payloadSignatures);
    });

    // Lastly Payer signs envelope
    final envelope = foldEnvelope(payload, transaction);

    final envelopeSignature = Transaction_Signature()
      ..address = payer
      ..keyId = keyId
      ..signature = signData(envelope, privateKey, DOMAIN_TAG);

    final envelopeSignatures = [envelopeSignature];
    transaction.envelopeSignatures.insertAll(0, envelopeSignatures);

    final request = SendTransactionRequest()..transaction = transaction;

    return client.sendTransaction(request);
  }

  /// Gets events of [eventName] type emitted in range from [rangeStart] to [rangeEnd].
  Future<EventsResponse> getEventsInRange(String eventName,
      {required Int64 rangeStart, required Int64 rangeEnd, Int64? rangeSize}) {
    // TODO: allow to skip some

    final request = GetEventsForHeightRangeRequest()
      ..type = eventName
      ..startHeight = rangeStart
      ..endHeight = rangeEnd;

    return this.getAccessClient().getEventsForHeightRange(request);
  }

  /// Decodes result of script execution into Map.
  Map<String, dynamic> decodeResponse(ExecuteScriptResponse response) {
    return jsonDecode(utf8.decode(response.value)) as Map<String, dynamic>;
  }
}

/// TODO: add execution at block id

///
//  Generated code. Do not modify.
//  source: flow/execution/execution.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'execution.pb.dart' as $0;
export 'execution.pb.dart';

class ExecutionAPIClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$0.PingRequest, $0.PingResponse>(
      '/flow.execution.ExecutionAPI/Ping',
      ($0.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PingResponse.fromBuffer(value));
  static final _$getAccountAtBlockID = $grpc.ClientMethod<
          $0.GetAccountAtBlockIDRequest, $0.GetAccountAtBlockIDResponse>(
      '/flow.execution.ExecutionAPI/GetAccountAtBlockID',
      ($0.GetAccountAtBlockIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetAccountAtBlockIDResponse.fromBuffer(value));
  static final _$executeScriptAtBlockID = $grpc.ClientMethod<
          $0.ExecuteScriptAtBlockIDRequest, $0.ExecuteScriptAtBlockIDResponse>(
      '/flow.execution.ExecutionAPI/ExecuteScriptAtBlockID',
      ($0.ExecuteScriptAtBlockIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ExecuteScriptAtBlockIDResponse.fromBuffer(value));
  static final _$getEventsForBlockIDs = $grpc.ClientMethod<
          $0.GetEventsForBlockIDsRequest, $0.GetEventsForBlockIDsResponse>(
      '/flow.execution.ExecutionAPI/GetEventsForBlockIDs',
      ($0.GetEventsForBlockIDsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetEventsForBlockIDsResponse.fromBuffer(value));
  static final _$getTransactionResult = $grpc.ClientMethod<
          $0.GetTransactionResultRequest, $0.GetTransactionResultResponse>(
      '/flow.execution.ExecutionAPI/GetTransactionResult',
      ($0.GetTransactionResultRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetTransactionResultResponse.fromBuffer(value));
  static final _$getRegisterAtBlockID = $grpc.ClientMethod<
          $0.GetRegisterAtBlockIDRequest, $0.GetRegisterAtBlockIDResponse>(
      '/flow.execution.ExecutionAPI/GetRegisterAtBlockID',
      ($0.GetRegisterAtBlockIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetRegisterAtBlockIDResponse.fromBuffer(value));
  static final _$getLatestBlockHeader = $grpc.ClientMethod<
          $0.GetLatestBlockHeaderRequest, $0.BlockHeaderResponse>(
      '/flow.execution.ExecutionAPI/GetLatestBlockHeader',
      ($0.GetLatestBlockHeaderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.BlockHeaderResponse.fromBuffer(value));
  static final _$getBlockHeaderByID =
      $grpc.ClientMethod<$0.GetBlockHeaderByIDRequest, $0.BlockHeaderResponse>(
          '/flow.execution.ExecutionAPI/GetBlockHeaderByID',
          ($0.GetBlockHeaderByIDRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.BlockHeaderResponse.fromBuffer(value));

  ExecutionAPIClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.PingResponse> ping($0.PingRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAccountAtBlockIDResponse> getAccountAtBlockID(
      $0.GetAccountAtBlockIDRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccountAtBlockID, request, options: options);
  }

  $grpc.ResponseFuture<$0.ExecuteScriptAtBlockIDResponse>
      executeScriptAtBlockID($0.ExecuteScriptAtBlockIDRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$executeScriptAtBlockID, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetEventsForBlockIDsResponse> getEventsForBlockIDs(
      $0.GetEventsForBlockIDsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEventsForBlockIDs, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTransactionResultResponse> getTransactionResult(
      $0.GetTransactionResultRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTransactionResult, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRegisterAtBlockIDResponse> getRegisterAtBlockID(
      $0.GetRegisterAtBlockIDRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRegisterAtBlockID, request, options: options);
  }

  $grpc.ResponseFuture<$0.BlockHeaderResponse> getLatestBlockHeader(
      $0.GetLatestBlockHeaderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLatestBlockHeader, request, options: options);
  }

  $grpc.ResponseFuture<$0.BlockHeaderResponse> getBlockHeaderByID(
      $0.GetBlockHeaderByIDRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockHeaderByID, request, options: options);
  }
}

abstract class ExecutionAPIServiceBase extends $grpc.Service {
  $core.String get $name => 'flow.execution.ExecutionAPI';

  ExecutionAPIServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PingRequest, $0.PingResponse>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PingRequest.fromBuffer(value),
        ($0.PingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAccountAtBlockIDRequest,
            $0.GetAccountAtBlockIDResponse>(
        'GetAccountAtBlockID',
        getAccountAtBlockID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetAccountAtBlockIDRequest.fromBuffer(value),
        ($0.GetAccountAtBlockIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExecuteScriptAtBlockIDRequest,
            $0.ExecuteScriptAtBlockIDResponse>(
        'ExecuteScriptAtBlockID',
        executeScriptAtBlockID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ExecuteScriptAtBlockIDRequest.fromBuffer(value),
        ($0.ExecuteScriptAtBlockIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetEventsForBlockIDsRequest,
            $0.GetEventsForBlockIDsResponse>(
        'GetEventsForBlockIDs',
        getEventsForBlockIDs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetEventsForBlockIDsRequest.fromBuffer(value),
        ($0.GetEventsForBlockIDsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTransactionResultRequest,
            $0.GetTransactionResultResponse>(
        'GetTransactionResult',
        getTransactionResult_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTransactionResultRequest.fromBuffer(value),
        ($0.GetTransactionResultResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRegisterAtBlockIDRequest,
            $0.GetRegisterAtBlockIDResponse>(
        'GetRegisterAtBlockID',
        getRegisterAtBlockID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRegisterAtBlockIDRequest.fromBuffer(value),
        ($0.GetRegisterAtBlockIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLatestBlockHeaderRequest,
            $0.BlockHeaderResponse>(
        'GetLatestBlockHeader',
        getLatestBlockHeader_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetLatestBlockHeaderRequest.fromBuffer(value),
        ($0.BlockHeaderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBlockHeaderByIDRequest,
            $0.BlockHeaderResponse>(
        'GetBlockHeaderByID',
        getBlockHeaderByID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetBlockHeaderByIDRequest.fromBuffer(value),
        ($0.BlockHeaderResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PingResponse> ping_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PingRequest> request) async {
    return ping(call, await request);
  }

  $async.Future<$0.GetAccountAtBlockIDResponse> getAccountAtBlockID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetAccountAtBlockIDRequest> request) async {
    return getAccountAtBlockID(call, await request);
  }

  $async.Future<$0.ExecuteScriptAtBlockIDResponse> executeScriptAtBlockID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ExecuteScriptAtBlockIDRequest> request) async {
    return executeScriptAtBlockID(call, await request);
  }

  $async.Future<$0.GetEventsForBlockIDsResponse> getEventsForBlockIDs_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetEventsForBlockIDsRequest> request) async {
    return getEventsForBlockIDs(call, await request);
  }

  $async.Future<$0.GetTransactionResultResponse> getTransactionResult_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetTransactionResultRequest> request) async {
    return getTransactionResult(call, await request);
  }

  $async.Future<$0.GetRegisterAtBlockIDResponse> getRegisterAtBlockID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetRegisterAtBlockIDRequest> request) async {
    return getRegisterAtBlockID(call, await request);
  }

  $async.Future<$0.BlockHeaderResponse> getLatestBlockHeader_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetLatestBlockHeaderRequest> request) async {
    return getLatestBlockHeader(call, await request);
  }

  $async.Future<$0.BlockHeaderResponse> getBlockHeaderByID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetBlockHeaderByIDRequest> request) async {
    return getBlockHeaderByID(call, await request);
  }

  $async.Future<$0.PingResponse> ping(
      $grpc.ServiceCall call, $0.PingRequest request);
  $async.Future<$0.GetAccountAtBlockIDResponse> getAccountAtBlockID(
      $grpc.ServiceCall call, $0.GetAccountAtBlockIDRequest request);
  $async.Future<$0.ExecuteScriptAtBlockIDResponse> executeScriptAtBlockID(
      $grpc.ServiceCall call, $0.ExecuteScriptAtBlockIDRequest request);
  $async.Future<$0.GetEventsForBlockIDsResponse> getEventsForBlockIDs(
      $grpc.ServiceCall call, $0.GetEventsForBlockIDsRequest request);
  $async.Future<$0.GetTransactionResultResponse> getTransactionResult(
      $grpc.ServiceCall call, $0.GetTransactionResultRequest request);
  $async.Future<$0.GetRegisterAtBlockIDResponse> getRegisterAtBlockID(
      $grpc.ServiceCall call, $0.GetRegisterAtBlockIDRequest request);
  $async.Future<$0.BlockHeaderResponse> getLatestBlockHeader(
      $grpc.ServiceCall call, $0.GetLatestBlockHeaderRequest request);
  $async.Future<$0.BlockHeaderResponse> getBlockHeaderByID(
      $grpc.ServiceCall call, $0.GetBlockHeaderByIDRequest request);
}

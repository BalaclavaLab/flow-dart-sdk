import 'package:flow_dart_sdk/wallet/app_info.dart';
import 'package:flow_dart_sdk/wallet/wallet_utils.dart';

import '../fcl/fcl.dart';
import '../wallet/wallet_provider.dart';

void main() async {
  const String blocto = 'https://flow-wallet.blocto.app/api/flow/authn';
  const endpoint = "access.testnet.nodes.onflow.org";
  const port = 9000;
  final FlowClient flow = FlowClient(
      endpoint,
      port,
      AppInfo('https://starly.io', 'Starly', 'starlydev'),
      WalletProvider(blocto, 'Blocto'),
      WalletListener((uri) => {print(uri)}, () => {}));

  await flow.authenticate();
}

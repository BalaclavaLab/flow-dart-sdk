import 'dart:convert';

import 'package:flow_dart_sdk/wallet/app_info.dart';
import 'package:flow_dart_sdk/wallet/response.dart';
import 'package:flow_dart_sdk/wallet/wallet_provider.dart';
import 'package:http/http.dart' as http;

class WalletHelper {
  static const locationParam = 'l6n';

  final AppInfo _appInfo;
  final WalletListener _listener;
  final WalletProvider _walletProvider;

  WalletHelper(this._appInfo, this._walletProvider, this._listener);

  Uri buildUrl(String baseUrl, String location, {Map<String, dynamic>? params}) {
    final baseUri = Uri.parse(baseUrl);
    final queryParams = {...baseUri.queryParameters, if (params != null) ...params};
    if (!queryParams.containsKey(locationParam)) {
      queryParams[locationParam] = location;
    }

    final finalParams = <String, String>{};
    // Stringify
    for (var e in queryParams.entries) {
      finalParams[e.key] = e.value.toString();
    }

    return Uri.https(baseUri.authority, baseUri.path, finalParams);
  }

  Future<void> performHttpRequest() async {
    final result = await fetchService(_walletProvider.endpoint);
    print(result);
  }

  Future<bool> fetchService(String url, {Map<String, String>? params}) async {
    final fullUrl = buildUrl(url, _appInfo.url, params: params);
    final result = Response.fromJson(jsonDecode((await http.post(fullUrl)).body));
    switch (result.status) {
      case ResponseStatus.approved:
        return true;
      case ResponseStatus.declined:
        return false;
      case ResponseStatus.pending:
        {
          final pending = result.asResponsePending();
          if (pending.local == null) return false;

          await openAuthorization(pending.local!);
          await poll(pending.updates);
        }
    }

    return true;
  }

  Future<void> openAuthorization(Service local) async {
    final uri = buildUrl(local.endpoint, _appInfo.url, params: local.params);
    _listener.openWebView(uri);
    await Future.delayed(Duration(seconds: 10));
  }

  Future<void> poll(Service updated) async {
    final fullUrl = buildUrl(updated.endpoint, _appInfo.url, params: updated.params);

    print(fullUrl);

    final result = Response.fromJson(jsonDecode((await http.get(fullUrl)).body));
    switch (result.status) {
      case ResponseStatus.approved:
        _listener.closeWebView.call();
        return;
      case ResponseStatus.declined:
        return;
      case ResponseStatus.pending:
        {
          final pending = result.asResponsePending();
          await Future.delayed(Duration(milliseconds: 500));
          await poll(pending.updates);
        }
    }

    return;
  }
}

class WalletListener {
  final Function(Uri uri) openWebView;
  final Function closeWebView;

  WalletListener(this.openWebView, this.closeWebView);
}

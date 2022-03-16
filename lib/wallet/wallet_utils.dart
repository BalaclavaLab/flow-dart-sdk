import 'dart:convert';

import 'package:flow_dart_sdk/wallet/response.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;

class WalletUtils {
  static Uri buildUrl(String baseUrl, String location, {Map<String, dynamic>? params}) {
    final baseUri = Uri.parse(baseUrl);
    final queryParams = {...baseUri.queryParameters, if (params != null) ...params};
    if (!queryParams.containsKey('l6n')) {
      queryParams['l6n'] = location;
    }

    final finalParams = <String, String>{};
    // Stringify
    for (var e in queryParams.entries) {
      finalParams[e.key] = e.value.toString();
    }

    return Uri.https(baseUri.authority, baseUri.path, finalParams);
  }

  static Future<void> performHttpRequest(String url) async {
    final result = await fetchService(url);
    print(result);
  }

  static Future<bool> fetchService(String url, {Map<String, String>? params}) async {
    final fullUrl = buildUrl(url, 'https://canary.starly.io', params: params);

    print(fullUrl);

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

  static Future<void> openAuthorization(Service local) async {
    final uri = buildUrl(local.endpoint, 'https://canary.starly.io', params: local.params);
    print(uri.toString());
    print('Sleep');
    print('Wake');
    final result = await FlutterWebAuth.authenticate(url: uri.toString(),callbackUrlScheme: 'starlydev');
    await Future.delayed(Duration(seconds: 10));
  }

  /*
  *         if !canContinue {
            completion(Result.failure(FCLError.declined))
            return
        }

        guard let url = service.endpoint else {
            completion(Result.failure(FCLError.invaildURL))
            return
        }

        fetchService(url: url, method: "GET", params: service.params) { response in
            if case let .success(result) = response {
                switch result.status {
                case .approved:
                    self.closeSession()
                    completion(response)
                case .declined:
                    completion(Result.failure(FCLError.declined))
                case .pending:
                    // TODO: Improve this
                    DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(500)) {
                        self.poll(service: service) { response in
                            completion(response)
                        }
                    }
                }
            }

            if case let .failure(error) = response {
                completion(Result.failure(error))
            }
        }*/

  static Future<void> poll(Service updated) async {
    print('POLL');
    final fullUrl = buildUrl(updated.endpoint, 'https://canary.starly.io', params: updated.params);

    print(fullUrl);

    final result = Response.fromJson(jsonDecode((await http.post(fullUrl)).body));
    switch (result.status) {
      case ResponseStatus.approved:
        print('APPROVED');
        return;
      case ResponseStatus.declined:
        print('DECLINED');
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

/*
  *         fetchService(url: url, method: "POST") { response in

            DispatchQueue.main.async {
                self.delegate?.hideLoading()
            }

            switch response {
            case let .success(result):
                switch result.status {
                case .approved:
                    completion(response)
                case .declined:
                    completion(Result.failure(FCLError.declined))
                case .pending:
                    self.canContinue = true
                    guard let local = result.local, let updates = result.updates else {
                        completion(Result.failure(FCLError.generic))
                        return
                    }
                    do {
                        try self.openAuthenticationSession(service: local)
                    } catch {
                        completion(Result.failure(error))
                    }
                    self.poll(service: updates) { response in
                        completion(response)
                    }
                }
            case let .failure(error):
                completion(Result.failure(error))
            }
        } */
}

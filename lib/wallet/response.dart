import 'package:equatable/equatable.dart';

/**
 * // APPROVED
    {
    f_type: "PollingResponse",
    f_vsn: "1.0.0",
    status: "APPROVED",
    data: ___, // what the service needs to send to FCL
    }

    // Declined
    {
    f_type: "PollingResponse",
    f_vsn: "1.0.0",
    status: "DECLINED",
    reason: "Declined by user."
    }

    // Pending - Simple
    {
    f_type: "PollingResponse",
    f_vsn: "1.0.0",
    status: "PENDING",
    updates: {
    f_type: "Service",
    f_vsn: "1.0.0",
    type: "back-channel-rpc",
    endpoint: "https://____", // where post request will be sent
    method: "HTTP/POST",
    data: {},   // will be included in the requests body
    params: {}, // will be included in the requests url
    }
    }

    // Pending - First Time with Local
    {
    f_type: "PollingResponse",
    f_vsn: "1.0.0",
    status: "PENDING",
    updates: {
    f_type: "Service",
    f_vsn: "1.0.0",
    type: "back-channel-rpc",
    endpoint: "https://____", // where post request will be sent
    method: "HTTP/POST",
    data: {},   // included in body of request
    params: {}, // included as query params on endpoint
    },
    local: {
    f_type: "Service",
    f_vsn: "1.0.0",
    endpoint: "https://____", // the iframe that will be rendered,
    method: "VIEW/IFRAME",
    data: {}, // sent to frame when ready
    params: {}, // included as query params on endpoint
    }
    }
 */

enum ResponseStatus { pending, approved, declined }

extension ResponseStatusExtension on ResponseStatus {
  static ResponseStatus fromString(String value) {
    switch (value) {
      case 'APPROVED':
        return ResponseStatus.approved;
      case 'DECLINED':
        return ResponseStatus.declined;
      case 'PENDING':
        return ResponseStatus.pending;
      default:
        throw "Unknown response status: $value";
    }
  }
}

class Response {
  Response(this.responseBody, this.status, this.fType, this.fVsn);

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
        json, ResponseStatusExtension.fromString(json['status']), json['f_type'], json['f_vsn']);
  }

  final Map<String, dynamic> responseBody;
  final ResponseStatus status;
  final String fType;
  final String fVsn;

  ResponsePending asResponsePending() {
    return ResponsePending(
        responseBody,
        status,
        fType,
        fVsn,
        Service.fromJson(responseBody['updates']),
        responseBody.containsKey('local') ? Service.fromJson(responseBody['local']) : null);
  }
}

class ResponseApproved extends Response {
  ResponseApproved(
      Map<String, dynamic> responseBody, ResponseStatus status, String type, String fVsn)
      : super(responseBody, status, type, fVsn);
}

class ResponseDeclined extends Response {
  ResponseDeclined(Map<String, dynamic> responseBody, ResponseStatus status, String type,
      String fVsn, this.reason)
      : super(responseBody, status, type, fVsn);

  final String reason;
}

class ResponsePending extends Response {
  ResponsePending(Map<String, dynamic> responseBody, ResponseStatus status, String type,
      String fVsn, this.updates, this.local)
      : super(responseBody, status, type, fVsn);
  final Service updates;
  final Service? local;
}

class Service extends Equatable {
  final String endpoint;
  final Map<String, dynamic>? data;
  final Map<String, dynamic> params;

  final Method method;

  Service(this.endpoint, this.data, this.params, this.method);

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
        json['endpoint'], json['data'], json['params'], MethodExtension.fromString(json['method']));
  }

  @override
  List<Object?> get props => [];
}

enum Method { httpPost, httpGet, viewIFrame, viewTab, viewPop }

extension MethodExtension on Method {
  static Method fromString(String value) {
    switch (value) {
      case 'HTTP/POST':
        return Method.httpPost;
      case 'HTTP/GET':
        return Method.httpGet;
      case 'VIEW/POP':
        return Method.viewPop;
      case 'VIEW/TAB':
        return Method.viewTab;
      case 'VIEW/IFRAME':
        return Method.viewIFrame;
      default:
        throw "Unknown type: $value";
    }
  }
}

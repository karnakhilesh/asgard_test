import 'package:asgard/app/core/services/services.dart';

abstract class AsgardHeaders {
  static Future<Map<String, String>?> getHeaders(AsgardRequest request) async {
    Map<String, String>? headers;

    if (request.isHeadersRequired) {
      headers = {
        if (request.isContentTypeRequired)
          'Content-Type': _getContentType(request),
        if (request.isAuthorizationRequired) "Authorization": "Bearer Token",
      };

      if (!(request.isAuthorizationRequired)) {
        if (headers.containsKey('Authorization')) {
          headers.remove('Authorization');
        }
      }
    }

    request.headers = headers;
    return headers;
  }

  static String _getContentType(AsgardRequest req) {
    if (req.isContentTypeUrlEncoded) {
      return 'application/x-www-form-urlencoded';
    }
    return 'application/json';
  }
}

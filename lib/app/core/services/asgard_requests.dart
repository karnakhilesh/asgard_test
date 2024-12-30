class AsgardRequest {
  final String apiPath;
  final Map<String, dynamic>? body;
  Map<String, String>? headers;
  final Map<String, dynamic>? queryParams;
  final bool isHeadersRequired;
  final bool isContentTypeRequired;
  final bool isAuthorizationRequired;
  final bool isContentTypeUrlEncoded;

  AsgardRequest({
    required this.apiPath,
    this.body,
    this.headers,
    this.queryParams,
    this.isHeadersRequired = true,
    this.isContentTypeRequired = true,
    this.isAuthorizationRequired = true,
    this.isContentTypeUrlEncoded = false,
  });
}

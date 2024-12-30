import 'dart:async';

import 'package:asgard/app/core/services/services.dart';
import 'package:get/get.dart';

class AsgardApiService extends GetConnect implements GetxService {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 30);

    super.onInit();
  }

  Future<T?> getRequest<T>(AsgardRequest request) async => handleResponse(
        request,
        () async => await get<T>(
          request.apiPath,
          query: request.queryParams,
          headers: await AsgardHeaders.getHeaders(request),
        ),
      );

  Future<T?> postRequest<T>(AsgardRequest request) async => handleResponse(
        request,
        () async => await post(
          request.apiPath,
          request.body,
          query: request.queryParams,
          headers: await AsgardHeaders.getHeaders(request),
        ),
      );

  Future<T?> putRequest<T>(AsgardRequest request) async => handleResponse(
        request,
        () async => await put(
          request.apiPath,
          request.body,
          query: request.queryParams,
          headers: await AsgardHeaders.getHeaders(request),
        ),
      );

  Future<T?> patchRequest<T>(AsgardRequest request) async => handleResponse(
        request,
        () async => await patch(
          request.apiPath,
          request.body,
          query: request.queryParams,
          headers: await AsgardHeaders.getHeaders(request),
        ),
      );
}

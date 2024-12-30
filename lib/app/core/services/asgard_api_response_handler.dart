// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:asgard/app/core/errors/errors.dart';
import 'package:asgard/app/core/services/services.dart';
import 'package:get/get.dart';

Future<T?> handleResponse<T>(AsgardRequest request, Function() body) async {
  try {
    final response = await body() as Response;

    if (response.statusText
            ?.toLowerCase()
            .contains('SocketException'.toLowerCase()) ??
        false) {
      throw NetworkException();
    }

    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return response.body as T;
      case 204:
        break;
      case 400:
      case 422:
        throw BadRequestException(await _asgardErrDecoder(response, request));
      case 401:
      case 403:
        throw UnauthorisedException(await _asgardErrDecoder(response, request));
      case 404:
        throw NotFoundException(await _asgardErrDecoder(response, request));
      case 500:
      default:
        throw InternalErrorException(
            await _asgardErrDecoder(response, request));
    }
  } catch (er) {
    throw InternalErrorException(er.toString());
  }

  return null;
}

Future<String> _asgardErrDecoder(
    Response response, AsgardRequest request) async {
  try {
    if (response.body == 'null' ||
        response.body == '' ||
        response.body == null) {
      return "No Response";
    } else if (response.body != null) {
      if (response.body is Map<String, dynamic>) {
        return _mapTypeOfErrorDecoder(response);
      } else if (response.body is String) {
        return (response.statusText ?? '').toString();
      }
    } else if (GetUtils.isNullOrBlank(response.statusText) == false) {
      return response.statusText!;
    } else {
      return response.statusText ?? internalErrorExceptionMessage;
    }
  } catch (er) {
    throw InternalErrorException(er.toString());
  }

  return internalErrorExceptionMessage;
}

String _mapTypeOfErrorDecoder(Response response) {
  try {
    if (response.body != null) {
      final body = response.body as Map<String, dynamic>?;

      if (body != null && body.isNotEmpty) {
        if (body.containsKey("message") && body["message"] != null) {
          final bdy = body["message"] as String?;

          if (bdy != null && bdy.isNotEmpty) {
            return bdy;
          }
        } else if (body.containsKey("error") && body["error"] != null) {
          final _err = body["error"] as String?;

          if (_err != null && _err.isNotEmpty && _err.toLowerCase() != 'null') {
            return _err;
          }
        } else if (body.containsKey("exception") && body["exception"] != null) {
          final expObj = body["exception"] as Map<String, dynamic>?;

          if (expObj != null &&
              expObj.isNotEmpty &&
              expObj.containsKey('error') &&
              expObj['error'] != null) {
            final err = expObj["error"] as Map<String, dynamic>?;

            if (err != null &&
                err.isNotEmpty &&
                err.containsKey('description') &&
                err['description'] != null) {
              final desc = err['description'] as String?;

              if (desc != null && desc.isNotEmpty) {
                return desc;
              }
            }
          }
        } else if (body.containsKey("data") && body["data"] != null) {
          final bodyData = body["data"] as Map<String, dynamic>?;

          if (bodyData != null &&
              bodyData.isNotEmpty &&
              bodyData.containsKey("message") &&
              bodyData["message"] != null) {
            final msg = bodyData["message"] as String?;

            if (msg != null && msg.isNotEmpty && msg.toLowerCase() != 'null') {
              return msg;
            }
          }
        }
      }
    }
  } catch (e) {
    return internalErrorExceptionMessage;
  }

  return internalErrorExceptionMessage;
}

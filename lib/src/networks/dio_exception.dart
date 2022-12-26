import 'package:dio/dio.dart';
import 'package:firstflutter/src/utils/app_localizations_context.dart';
import 'package:flutter/cupertino.dart';

class DioException  implements Exception {
  late String errorMessage;
  late DioError dioError;

  DioException.fromDioError(DioError dioError, BuildContext context) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage =  context.loc.requestCancelled;
        break;
      case DioErrorType.connectTimeout:
        errorMessage = context.loc.connectionTimedOut;
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = context.loc.receivingTimeout;
        break;
      case DioErrorType.sendTimeout:
        errorMessage = context.loc.requestTimeout;
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response?.statusCode, context);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = context.loc.noInternet;
          break;
        }
        errorMessage = context.loc.unexpectedError;
        break;
      default:
        errorMessage = context.loc.somethingWrong;
        break;
    }
  }

  String _handleStatusCode(int? statusCode, BuildContext context) {
    switch (statusCode) {
      case 400:
        return context.loc.badRequest;
      case 401:
        return context.loc.authenticationFailed;
      case 403:
        return context.loc.authenticatedUserNotAllowed;
      case 404:
        return context.loc.resourceNotExist;
      case 405:
        return context.loc.methodNotAllowed;
      case 415:
        return context.loc.unsupportedMediaType;
      case 422:
        return context.loc.dataValidationFailed;
      case 429:
        return context.loc.tooManyRequests;
      case 500:
        return context.loc.internalServerError;
      default:
        return context.loc.oopsSomethingWrong;
    }
  }

  @override
  String toString() => errorMessage;


// @override
// Widget build(BuildContext context) {
//   DioException.fromDioError(dioError, context);
//   return Text(errorMessage);
// }
}
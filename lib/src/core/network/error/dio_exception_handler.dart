import 'package:dio/dio.dart';
import 'package:firstflutter/main.dart';
import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/core/utils/constant/app_constants.dart';

class DioErrorHandler {
  // Handle error return from api
  static handleDioError(DioException error) {
    String errorDescription = "";

    try {
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          {
            errorDescription = handleStatusCode(error.response?.statusCode);
            break;
          }

        case DioExceptionType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "Bad Certificate";
          break;
        case DioExceptionType.connectionError:
          errorDescription = "Connection Error";
          break;
        case DioExceptionType.unknown:
          errorDescription = unknownError;
          break;
      }
      return errorDescription;
    } catch (e) {
      return S.of(navigatorKey.currentContext!).internal_error;
    }
  }

  // Handle error as badResponse
  static String handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return S.of(navigatorKey.currentContext!).badRequest;
      case 401:
        return S.of(navigatorKey.currentContext!).authenticationFailed;
      case 403:
        return S.of(navigatorKey.currentContext!).authenticatedUserNotAllowed;
      case 404:
        return S.of(navigatorKey.currentContext!).resourceNotExist;
      case 405:
        return S.of(navigatorKey.currentContext!).methodNotAllowed;
      case 415:
        return S.of(navigatorKey.currentContext!).unsupportedMediaType;
      case 422:
        return S.of(navigatorKey.currentContext!).dataValidationFailed;
      case 429:
        return S.of(navigatorKey.currentContext!).tooManyRequests;
      case 500:
        return S.of(navigatorKey.currentContext!).internalServerError;
      default:
        return S.of(navigatorKey.currentContext!).oopsSomethingWrong;
    }
  }
}

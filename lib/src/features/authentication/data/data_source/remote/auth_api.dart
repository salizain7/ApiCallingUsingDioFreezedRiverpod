import 'package:dio/dio.dart';
import 'package:firstflutter/src/core/network/error/dio_exception_handler.dart';
import 'package:firstflutter/src/core/network/error/exceptions.dart';
import 'package:firstflutter/src/features/authentication/data/data_source/remote/auth_client.dart';
import 'package:firstflutter/src/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firstflutter/src/shared/domain/entities/response/api_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AuthApi {
  final AuthClient abstractAuthApi;

  AuthApi(this.abstractAuthApi);

  // Login api
  Future<ApiResponse<String>> login(LoginParams params) async {
    try {
      final result = await abstractAuthApi.login(params);
      return ApiResponse();
    } on DioException catch (e) {
      throw ServerException(
          DioErrorHandler.handleDioError(e), e.response?.statusCode);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}

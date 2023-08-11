import 'package:dio/dio.dart';
import 'package:firstflutter/src/core/network/apis/apis.dart';
import 'package:firstflutter/src/core/network/error/dio_exception_handler.dart';
import 'package:firstflutter/src/core/network/error/exceptions.dart';
import 'package:firstflutter/src/features/authentication/data/data_source/remote/abstract_auth_api.dart';
import 'package:firstflutter/src/features/authentication/domain/entities/params/login_params.dart';
import 'package:firstflutter/src/shared/domain/entities/response/api_response_model.dart';

class AuthApi extends GeneralAuthApi {
  AuthApi(super.dio);

  // Login api
  @override
  Future<ApiResponse<String>> login(LoginParams params) async {
    try {
      final result = (await dio.post(
        ApisList.login,
        data: params.toJson(),
      ));

      // ApiResponse<AuthResponseModel> response =
      // ApiResponse.fromJson(result.data, AuthResponseModel.fromJson);
      // return response;
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

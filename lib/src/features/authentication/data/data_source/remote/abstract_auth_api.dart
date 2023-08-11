import 'package:dio/dio.dart';
import 'package:firstflutter/src/features/authentication/domain/entities/params/login_params.dart';
import 'package:firstflutter/src/shared/domain/entities/response/api_response_model.dart';

abstract class GeneralAuthApi {
  final Dio dio;

  GeneralAuthApi(this.dio);

  // Login Api
  Future<ApiResponse<String>> login(LoginParams params);
}

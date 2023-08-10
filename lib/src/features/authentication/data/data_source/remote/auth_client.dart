import 'package:dio/dio.dart';
import 'package:firstflutter/src/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firstflutter/src/shared/domain/entities/response/api_response_model.dart';
import 'package:firstflutter/src/shared/domain/providers/dio/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'auth_client.g.dart';



@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio) = _AuthClient;

  @GET("login")
  Future<ApiResponse<String>> login(@Body() LoginParams params);

// Add more endpoints here....
}

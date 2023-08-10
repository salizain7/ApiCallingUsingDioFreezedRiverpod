import 'package:dio/dio.dart';

class AppInterceptor extends InterceptorsWrapper {
  @override
  onError(DioException error, ErrorInterceptorHandler handler) {
    return handler.reject(error);
  }

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle unauthorized and unauthenticated api
    return handler.next(response);
  }
}

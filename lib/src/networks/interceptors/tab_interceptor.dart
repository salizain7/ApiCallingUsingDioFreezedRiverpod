import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../di/service_locator.dart';

@lazySingleton
class TabInterceptor extends InterceptorsWrapper{

 // final sharePreference = getIt<SharedPreferencesStorage>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    const token = '1234';// sharePreference.oAuthToken;
    if (token != null && token.isNotEmpty) {
      options.queryParameters.putIfAbsent('auth', () => token);
      super.onRequest(options, handler);
      return;
    }
    super.onRequest(options, handler);
  }

}
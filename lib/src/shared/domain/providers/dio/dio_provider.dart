import 'package:dio/dio.dart';
import 'package:firstflutter/src/core/network/interceptors/logger_interceptor.dart';
import 'package:firstflutter/src/core/network/interceptors/queue_interceptor.dart';
import 'package:firstflutter/src/core/utils/constant/network_constant.dart';
import 'package:firstflutter/src/core/utils/log/app_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio(
      // Dio options like base url, headers, timeout...
      BaseOptions(
        baseUrl: apiUrl,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          "charset": "utf-8",
          "Accept-Charset": "utf-8"
        },
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 60),
        // 60 seconds
        receiveTimeout: const Duration(seconds: 60),
      ),
    );

    dio.interceptors.add(LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    ));

    // Add Interceptor for dio
    dio.interceptors.add(AppInterceptor());

    return dio;
  },
);

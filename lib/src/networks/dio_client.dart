import 'package:dio/dio.dart';

class DioClient{

  static final DioClient instance = DioClient();
  //Bases urls from many server
  static const baseUrl = 'https://api.coinpaprika.com/v1/coins/';
  // static const tysonBaseUrl = 'https://lmt.globalsports.app/';
  // static const sportsBaseUrl = 'https://api.globalsports.app/';
  // static const sportsUsersBaseUrl = 'https://user.globalsports.app/';
  // static const newsBaseUrl = 'https://scrnews77.online/';
  //
  // static const String sportsUsersApiPath = "api/v1/";
  // static const String liveAnimationApiPath = "sc/";
  // static const String authApiPath = "auth/";

  Dio getDioClient(InterceptorsWrapper interceptorsWrapper){
    final dio = Dio();
    // Set default configs
    dio.options.baseUrl = baseUrl;
    //dio.options.connectTimeout = 15000; //5s
    //dio.options.receiveTimeout = 15000; //3s
    dio.interceptors.add(interceptorsWrapper);
    return dio;
  }
}
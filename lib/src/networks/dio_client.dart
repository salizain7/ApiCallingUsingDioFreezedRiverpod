import 'package:dio/dio.dart';

class DioClient{

  static final DioClient instance = DioClient();
  //Bases urls from many server
  static const baseUrl = 'https://api.coinpaprika.com/v1/coins/';

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
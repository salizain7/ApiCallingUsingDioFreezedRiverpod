// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:retrofit/http.dart';
//
// import '../features/home/domain/coin_model.dart';
//
// part 'tab_api_client.g.dart';
//
// @RestApi()
// abstract class TabApiClient{
//
//   @factoryMethod
//   factory TabApiClient(Dio dio, {String baseUrl}) = _TabApiClient;
//
//   @GET("btc-bitcoin")
//   Future<CoinModel> getTabBtc();
//
// }
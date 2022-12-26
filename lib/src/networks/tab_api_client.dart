import 'package:dio/dio.dart';
import 'package:firstflutter/src/screens/domain/coin.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'tab_api_client.g.dart';

@RestApi()
abstract class TabApiClient{

  @factoryMethod
  factory TabApiClient(Dio dio, {String baseUrl}) = _TabApiClient;

  @GET("btc-bitcoin")
  Future<CoinModel> getTabBtc();

}
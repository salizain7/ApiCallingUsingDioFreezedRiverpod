
import 'package:dio/dio.dart';
import 'package:firstflutter/src/utils/app_localizations_context.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/service_locator.dart';
import '../../../../networks/dio_exception.dart';
import '../../../../networks/tab_api_client.dart';
import '../../../../utils/navigation_service.dart';
import '../../domain/coin.dart';

@injectable
class TabApiProvider{
  TabApiProvider(this.tabApiClient);

  final TabApiClient tabApiClient;

  Future<CoinModel> fetchTabData(String lang) async {

    try{
      var response = await tabApiClient.getTabBtc();
      // if(response.code == ResponseStatus.authenticationFailed) {
      //   // getIt<AuthRepository>().removeAuthTokenProvider();
      //   // getIt<AuthRepository>().authTokenProvider();
      //   response = await tabApiClient.getTabBtc(queries);
      // }
      return response;
    } on DioError catch (err){
      final errorMessage = DioException.fromDioError(err,getIt<NavigationService>().navigatorKey.currentContext!).toString();
      return CoinModel(team: null);
    } catch (e) {
      return CoinModel(team: null);
    }
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../../di/service_locator.dart';
import '../../domain/coin.dart';
import '../data_sources/tab_remote_source.dart';

abstract class TabRepository{
  Future<CoinModel> tabProvider( String lang);
}

@Injectable(as: TabRepository)
class TabRepositoryImp extends TabRepository{
  TabRepositoryImp(this.tabApiProvider);

  final TabApiProvider tabApiProvider;

  @override
  Future<CoinModel> tabProvider( String lang) async{
    final result = await tabApiProvider.fetchTabData(lang);
    return Future.value(result);
  }

}

final tabRepositoryProvider =  Provider<TabRepositoryImp>((ref) {
  final tabData =  getIt<TabRepositoryImp>();
  //ref.onDispose(() => auth.dispose());
  return tabData;
});

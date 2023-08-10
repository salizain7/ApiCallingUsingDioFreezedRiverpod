
import 'package:firstflutter/src/features/home/presentation/controller/tab_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/tab_repository.dart';
import '../../domain/coin.dart';

@injectable
class TabDataScreenController extends StateNotifier<TabDataState> {
  TabDataScreenController({required this.tabRepository})
      : super(const TabDataInitialState()){
    getTabData();
  }
  final TabRepository tabRepository;

  Future<void> getTabData() async {
    state = const TabDataLoadingState();
//en if arabic indian malaysia

    final tabModel = await tabRepository.tabProvider('en');
    // final newsModel = await newsRepository.newsListProvider(await navigationDrawerRepository.selectedLanguageProvider());
    if (tabModel.team != null) {
      tabData = tabModel.team![0];
      state = TabDataSuccessFetchDataState(tabData: tabModel.team![0]);

    }
    else{
      state =  TabDataErrorFetchDataState(errorMsg: 'Something went wrong, Please try later');
    }
  }

  late Coin tabData;

}

final tabDataScreenControllerProvider =
StateNotifierProvider.autoDispose<TabDataScreenController, TabDataState>(
        (ref) {
      return TabDataScreenController(
          tabRepository: ref.watch(tabRepositoryProvider)
      );
    });
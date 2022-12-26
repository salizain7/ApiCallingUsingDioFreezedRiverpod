

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../domain/coin.dart';

@immutable
abstract class TabDataState extends Equatable{
  const TabDataState();

  @override
  List<Object> get props => [];
}

class TabDataInitialState extends TabDataState {
  const TabDataInitialState();
}

class TabDataLoadingState extends TabDataState {
  const TabDataLoadingState();
}

class TabDataErrorFetchDataState extends TabDataState{
  final String errorMsg;
  const TabDataErrorFetchDataState({
    required this.errorMsg
  });
}


class TabDataSuccessFetchDataState extends TabDataState{
  final Coin tabData;
  const TabDataSuccessFetchDataState({
    required this.tabData
  });
}

class TabDataNoInternetState extends TabDataState {
  const TabDataNoInternetState();
}

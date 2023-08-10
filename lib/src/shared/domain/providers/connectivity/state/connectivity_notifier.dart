import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/connectivity_status_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatusEnum> {
  ConnectivityStatusEnum? lastResult;
  ConnectivityStatusEnum? newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatusEnum.isConnected) {
    if (state == ConnectivityStatusEnum.isConnected) {
      lastResult = ConnectivityStatusEnum.isConnected;
    } else if(state == ConnectivityStatusEnum.isDisconnected){
      lastResult = ConnectivityStatusEnum.isDisconnected;
    }
    lastResult = ConnectivityStatusEnum.notDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.mobile || ConnectivityResult.mobile == ConnectivityResult.wifi){
        newState = ConnectivityStatusEnum.isConnected;
      }else{
        newState = ConnectivityStatusEnum.isDisconnected;
      }
      state = newState!;

      if (newState != lastResult) {
        state = newState!;
        lastResult = newState;
      }
    });
  }
}
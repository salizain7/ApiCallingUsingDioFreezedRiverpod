import 'package:firstflutter/src/shared/domain/entities/enums/connectivity_status_enum.dart';
import 'package:firstflutter/src/shared/presentation/providers/connectivity/state/connectivity_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityStatusProviders =
    StateNotifierProvider<ConnectivityStatusNotifier, ConnectivityStatusEnum>(
        (ref) {
  return ConnectivityStatusNotifier();
});

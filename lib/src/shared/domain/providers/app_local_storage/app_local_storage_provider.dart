import 'package:firstflutter/src/shared/data/data_source/local/app_local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLocalStorageProvider = StateProvider<AppLocalStorage>((ref) {
  return AppLocalStorage();
});
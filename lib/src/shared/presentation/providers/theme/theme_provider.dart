import 'package:firstflutter/src/shared/data/data_source/local/app_local_storage.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/theme_mode_enum.dart';
import 'package:firstflutter/src/shared/injections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeModeEnum>((ref) {
  // Get current theme from local storage
 ThemeModeEnum theme = sl<AppLocalStorage>().getIsDarkTheme();
  return theme;
});
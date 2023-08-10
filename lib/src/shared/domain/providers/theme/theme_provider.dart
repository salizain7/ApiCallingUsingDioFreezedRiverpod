import 'package:firstflutter/src/shared/domain/entities/enums/language_enum.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/theme_mode_enum.dart';
import 'package:firstflutter/src/shared/domain/providers/app_local_storage/app_local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeModeEnum>((ref) {
  // Get current theme from local storage
 ThemeModeEnum theme =  ref.read(appLocalStorageProvider).getIsDarkTheme();
  return theme;
});
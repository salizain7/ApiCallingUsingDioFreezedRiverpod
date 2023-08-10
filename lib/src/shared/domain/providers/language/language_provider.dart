import 'package:firstflutter/src/core/helper/helper.dart';
import 'package:firstflutter/src/core/helper/helper_ui.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/language_enum.dart';
import 'package:firstflutter/src/shared/domain/providers/app_local_storage/app_local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider = StateProvider<LanguageEnum>((ref) {
  // Get current language from local storage
  LanguageEnum lang =  ref.read(appLocalStorageProvider).getLang();
  return lang;
});
import 'package:firstflutter/src/shared/data/data_source/local/app_local_storage.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/language_enum.dart';
import 'package:firstflutter/src/shared/injections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider = StateProvider<LanguageEnum>((ref) {
  // Get current language from local storage
  LanguageEnum lang =  sl<AppLocalStorage>().getLang();
  return lang;
});
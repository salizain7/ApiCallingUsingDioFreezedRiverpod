import 'dart:convert';

import 'package:firstflutter/src/core/utils/constant/app_constants.dart';
import 'package:firstflutter/src/core/utils/constant/local_storage_constants.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/language_enum.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/theme_mode_enum.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppLocalStorage {
  AppLocalStorage();

  /// __________ Language __________ ///
  LanguageEnum getLang() {
    Box box = Hive.box(langBox);
    String? value = box.get(langKey);
    if (value != null) {
      return LanguageEnum.values
          .firstWhere((element) => value == element.local);
    }
    return LanguageEnum.en;
  }

  void setLang(String local) {
    Box box = Hive.box(langBox);
    box.put(langKey, local);
  }

  deleteLang() {
    Box box = Hive.box(langBox);
    box.delete(langKey);
  }

  /// __________ Dark Theme __________ ///
  ThemeModeEnum getIsDarkTheme() {
    Box box = Hive.box(themeBox);
    String? value = box.get(themeKey);
    if(value!= null){
      if(value == dark){
        return ThemeModeEnum.dark;
      }else{
        return ThemeModeEnum.light;
      }
    }
    return ThemeModeEnum.light;
  }

  void setDarkTheme(ThemeModeEnum theme) {
    Box box = Hive.box(themeBox);
    box.put(themeKey, theme.themeCode);
  }

  void deleteDarkTheme() {
    Box box = Hive.box(themeBox);
    box.delete(themeKey);
  }
}

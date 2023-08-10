import 'package:firstflutter/main.dart';
import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/core/utils/constant/app_constants.dart';

enum ThemeModeEnum {
  dark,
  light,
}

extension ThemeModeEnumExtension on ThemeModeEnum {
  String get theme {
    switch (this) {
      case ThemeModeEnum.dark:
        return S.of(navigatorKey.currentContext!).dark;

      case ThemeModeEnum.light:
        return S.of(navigatorKey.currentContext!).light;

      default:
        return S.of(navigatorKey.currentContext!).dark;
    }
  }

  String get themeCode {
    switch (this) {
      case ThemeModeEnum.dark:
        return "dark";

      case ThemeModeEnum.light:
        return "light";

      default:
        return "dark";
    }
  }


}

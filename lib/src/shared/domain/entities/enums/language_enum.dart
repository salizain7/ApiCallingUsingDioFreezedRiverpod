import 'package:firstflutter/main.dart';
import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/core/utils/constant/app_constants.dart';

enum LanguageEnum {
  ar, // Arabic
  en, // English
}

extension LanguageEnumExtension on LanguageEnum {
  String get local {
    switch (this) {
      case LanguageEnum.ar:
        return "ar";

      case LanguageEnum.en:
        return "en";

      default:
        return "1";
    }
  }

  String get localHeader {
    switch (this) {
      case LanguageEnum.ar:
        return "ar_AE";

      case LanguageEnum.en:
        return "en_US";

      default:
        return "en_US";
    }
  }

  String get langName {
    switch (this) {
      case LanguageEnum.ar:
        return S.of(navigatorKey.currentContext!).arabic;

      case LanguageEnum.en:
        return S.of(navigatorKey.currentContext!).english;

      default:
        return S.of(navigatorKey.currentContext!).english;
    }
  }

  String get icon {
    switch (this) {
      case LanguageEnum.ar:
        return "uae.png";

      case LanguageEnum.en:
        return "uk.png";

      default:
        return "uae.png";
    }
  }

  String get lanShortCut {
    switch (this) {
      case LanguageEnum.ar:
        return uae;

      case LanguageEnum.en:
        return uk;

      default:
        return uae;
    }
  }
}

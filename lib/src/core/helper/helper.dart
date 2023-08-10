import 'dart:io';

import 'package:firstflutter/src/shared/domain/entities/enums/app_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Helper {
  // Get svg picture path
  static String getSvgPath(String name) {
    return "assets/svg/$name";
  }

  // Get image picture path
  static String getImagePath(String name) {
    return "assets/images/$name";
  }

  // Get image picture path
  static String getVideoPath(String name) {
    return "assets/videos/$name";
  }

  // Get Dio Header
  static Map<String, dynamic> getHeaders() {
    // String? token = container.read(appLocalStorageProvider).getLang();
    String? token = "";
    if (token != null) {
      token = "Bearer ${token}";
    }

    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "charset": "utf-8",
      "Accept-Charset": "utf-8",
      "Authorization": token,
    }..removeWhere((key, value) => value == null);
  }

  // Get App Name
  static String getAppName() {
    return "mobile";
  }

  // Get App Name
  static AppEnum getDeviceType() {
    if (kIsWeb) {
      return AppEnum.web;
    }

    if (Platform.isAndroid || Platform.isIOS) {
      return AppEnum.mobile;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      if (kIsWeb) {
        return AppEnum.web;
      } else {
        return AppEnum.desktop;
      }
    }
    return AppEnum.mobile;
  }

  // Paste
  static Future<String> getCopiedText() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData == null) {
      return "";
    }
    return clipboardData.text ?? "";
  }
}

import 'dart:math';

import 'package:decimal/decimal.dart';

class MathHelper {
  // Format double
  //12.1222000 >> 12.1222 || 12.12
  static String getDouble({
    String defaultStr = "",
    required String amount,
    int countAfterPoint = 5,
    bool removeAllZero = true,
  }) {
    //0.12394531 -> 0.123
    if (amount.contains("e")) {
      amount = "${(Decimal.tryParse(amount) ?? 0)}";
    }
    double? num = double.tryParse(amount);
    if (num == null) {
      return defaultStr;
    }
    List<String> splitPont = "$num".split(".");

    if ("$num".contains("e")) {
      splitPont = amount.split(".");
    }
    if (splitPont.length > 1) {
      String afterPoint = splitPont[1];
      if (afterPoint.length > countAfterPoint) {
        afterPoint = afterPoint.substring(0, countAfterPoint);
      }
      while (
          afterPoint.length > 2 || (removeAllZero && afterPoint.isNotEmpty)) {
        if (afterPoint[afterPoint.length - 1] == "0") {
          afterPoint = afterPoint.substring(0, afterPoint.length - 1);
        } else {
          break;
        }
      }
      if (afterPoint.isEmpty && !removeAllZero) {
        afterPoint = "0";
      } else if (afterPoint.length == 1 && !removeAllZero) {
        afterPoint = "${afterPoint}0";
      }

      return "${splitPont[0]}${afterPoint.isEmpty ? "" : "."}$afterPoint";
    }
    String res = num.toDouble().toString();
    if (res.contains("e")) {
      double e = exp(double.parse(res));
      res = "$e";
    }

    return res;
  }

  // Epsilon equal
  static bool epsilonEquals(double a, double b, {double epsilon = 0.00001}) {
    return double.parse((getDouble(amount: (a - b).abs().toString()))) <=
        epsilon;
  }
}

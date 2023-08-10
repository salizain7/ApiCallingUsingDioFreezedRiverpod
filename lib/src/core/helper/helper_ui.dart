import 'dart:ui';

import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/language_enum.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/toast_type_enum.dart';
import 'package:firstflutter/src/shared/presentation/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HelperUi {
  /// Get vertical space
  static double getVerticalSpace() {
    return 10.h;
  }

  /// Get horizontal space
  static double getHorizontalSpace() {
    return 10.w;
  }

  static formatDate(DateTime date) {
    final formatted = DateFormat('yyyy-MM-dd');
    return formatted.format(date);
  }

  // format string to TimeOfDay
  static TimeOfDay parseTimeString(String timeString) {
    final dateTime = DateFormat.jm().parse(timeString);
    return TimeOfDay.fromDateTime(dateTime);
  }

  /// Show snack bar message
  static showSnackBar(BuildContext context, String message,
      {ToastTypeEnum type = ToastTypeEnum.info}) {
    Future.delayed(const Duration(seconds: 0), () {
      AppSnackBar.show(context, message, type);
    });
  }

  /// Show custom dialog with specific page
  static Future showCustomDialog(
    BuildContext context,
    Widget child, {
    EdgeInsets? margin,
    bool barrierDismissible = true,
    Color? backgroundColor,
    double? height,
    double? heightLand,
    double? borderRadius,
  }) async {
    return showDialog(
        context: context,
        useSafeArea: false,
        barrierDismissible: barrierDismissible,
        barrierColor: AppColors.darkFontColor.withOpacity(0.2),
        builder: (ctx) {
          return OrientationBuilder(builder: (context, orientation) {
            return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 30.h,
                    ),
                    child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      backgroundColor: AppColors.transparent,
                      body: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: ScreenUtil().orientation ==
                                      Orientation.portrait
                                  ? height
                                  : heightLand,
                              clipBehavior: Clip.hardEdge,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(borderRadius ?? 20.r),
                                color: backgroundColor ??
                                    Theme.of(context).dialogBackgroundColor,
                              ),
                              child: child,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          });
        });
  }

  /// Show custom bottom sheet with specific page
  static Future showBottomSheet(
    BuildContext context,
    Widget child, {
    BorderRadius? borderRadius,
    bool isScrollControlled = false,
    bool isDismissible = false,
    double? height,
    bool expanded = true,
  }) async {
    return await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: isScrollControlled,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ??
            const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isDismissible: isDismissible,
      barrierColor: AppColors.darkFontColor.withOpacity(0.2),
      builder: (BuildContext context) {
        return Container(
          height: height,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15.sp,
                ),
                Center(
                  child: Container(
                    width: 100.sp,
                    height: 7.sp,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrayColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                if (expanded) ...{
                  Expanded(
                    child: child,
                  ),
                } else ...{
                  child,
                }
              ],
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.only(
            //           bottom: MediaQuery.of(context).viewInsets.bottom),
            //       height: height,
            //       child: child,
            //     ),
            //   ],
            // ),
          ),
        );
      },
    );
  }

  // Format Date as 01-01-1998
  static String formatToStandardDate(DateTime dateTime) {
    DateFormat format = DateFormat('yyyy-MM-dd', LanguageEnum.en.local);
    String date = format.format(dateTime.toLocal());
    return date;
  }

  // Format Date as 18 Apr 2023
  static String formatNamedDate(DateTime dateTime) {
    String formattedDate = DateFormat('dd MMM yyyy', LanguageEnum.en.local)
        .format(dateTime.toLocal());
    return formattedDate;
  }

  // Get Status Bar Height
  static double getStatusBarHeight(BuildContext context) {
    return View.of(context).padding.top / View.of(context).devicePixelRatio;
  }

  // Get Height of Widget
  static double getWidgetHeight(GlobalKey key) {
    var context = key.currentContext;
    if (context == null) return 0;

    var newSize = context.size;
    return newSize?.height ?? 0;
  }

  // Get Width of Widget
  static double getWidgetWidth(GlobalKey key) {
    var context = key.currentContext;
    if (context == null) return 0;

    var newSize = context.size;
    return newSize?.width ?? 0;
  }
}

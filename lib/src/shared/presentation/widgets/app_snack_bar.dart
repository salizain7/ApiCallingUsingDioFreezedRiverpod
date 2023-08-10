import 'package:another_flushbar/flushbar.dart';
import 'package:firstflutter/src/core/helper/helper.dart';
import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:firstflutter/src/shared/domain/entities/enums/toast_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AppSnackBar {
  static late Flushbar snackBar;

  // static GlobalKey<ScaffoldState> scaffoldKey;

  static init() {
    snackBar = Flushbar();
  }

  static void show(
      BuildContext context, String text, ToastTypeEnum type) async {
    Color backgroundColor;
    switch (type) {
      case ToastTypeEnum.success:
        backgroundColor = AppColors.green;
        break;
      case ToastTypeEnum.error:
        backgroundColor = AppColors.red;
        break;
      default:
        backgroundColor = AppColors.grayColor;
    }

    snackBar.dismiss();
    snackBar = Flushbar(
      duration: const Duration(seconds: 4),
      message: text,
      messageColor: AppColors.white,
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(15),
      icon: type == ToastTypeEnum.success
          ? SvgPicture.asset(
              Helper.getSvgPath("check.svg"),
              height: 15.sp,
              width: 15.sp,
            )
          : SvgPicture.asset(
              Helper.getSvgPath("alert.svg"),
              height: 15.sp,
              width: 15.sp,
            ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.only(
        left: 15.sp,
        right: 15.sp,
        top: kToolbarHeight.h,
      ),
    );
    snackBar.show(context);
  }

  static void showWithUndo(String text, ToastTypeEnum type,
      Function undoCallback, Function deleteCallback, BuildContext context) {
    Color backgroundColor = const Color(0xFFF05454);
    late Flushbar flush;
    flush = Flushbar(
      duration: const Duration(seconds: 4),
      messageText: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.h,
        ),
      ),
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.BOTTOM,
      onStatusChanged: (status) {
        if (FlushbarStatus.DISMISSED == status) {}
      },
      mainButton: TextButton(
        child: Text(
          "Back",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.normal,
              ),
        ),
        onPressed: () {
          flush.dismiss();
          undoCallback();
        },
      ),
    );
    flush.show(context).then((value) {
      if (!flush.isDismissed()) {
        deleteCallback();
      }
    });
  }
}

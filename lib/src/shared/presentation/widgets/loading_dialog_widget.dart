import 'package:firstflutter/src/core/translations/l10n.dart';
import 'package:firstflutter/src/shared/presentation/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingDialogWidget {
  static void showLoadingDialog(BuildContext context,
      {String? message, Widget? child}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Container(
              width: ScreenUtil().screenWidth * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (child != null) ...{
                    child,
                  } else ...{
                    const AppLoader(),
                  },
                  SizedBox(height: 16.sp),
                  Text(
                    message ?? S.of(context).processing,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }
}

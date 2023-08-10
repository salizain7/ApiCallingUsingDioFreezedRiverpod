import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoader extends StatelessWidget {
  final double? size;

  const AppLoader({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SpinKitFoldingCube(
            size: size ?? 20.sp,
            color: AppColors.primaryColor,
            // itemBuilder: (BuildContext context, int index) {
            //   return DecoratedBox(
            //     decoration: BoxDecoration(
            //         color: AppColors.primaryColor,
            //         borderRadius: BorderRadius.circular(25)),
            //   );
            // },
          )),
    );
  }
}

import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItemWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Widget? trailing;
  final Function() onTap;

  const DrawerItemWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
    this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image and title
          Row(
            children: [
              image,

              SizedBox(
                width: 10.sp,
              ),

              // Title and sub title
              RichText(
                text: TextSpan(
                  children: [
                    // Title
                    TextSpan(
                        text: title,
                        style: titleStyle ??
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grayColor,
                                )),

                    if (subTitle != null) ...{
                      // Sub title
                      TextSpan(
                          text: subTitle,
                          style: subTitleStyle ??
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGrayColor,
                                  )),
                    }
                  ],
                ),
              ),
            ],
          ),

          if (trailing != null) ...{
            trailing!,
          }
        ],
      ),
    );
  }
}

import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReloadWidget extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final String image;
  final Color? iconColor;
  final double? imageSize;
  final double? iconSize;
  final TextStyle? textStyle;

  const ReloadWidget.empty({
    Key? key,
    required this.content,
    this.onPressed,
    this.iconColor,
    this.imageSize,
    this.textStyle,
    this.iconSize,
  })  : image = "assets/svg/empty.svg",
        super(key: key);

  const ReloadWidget.error({
    Key? key,
    required this.content,
    this.onPressed,
    this.iconColor,
    this.imageSize,
    this.textStyle,
    this.iconSize,
  })  : image = "assets/svg/error.svg",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(image,
                  width: imageSize ?? 100.h, height: imageSize ?? 100.h)),
          const SizedBox(height: 10),
          Text(
            content,
            style: textStyle ??
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.lightGrayColor,
                      fontWeight: FontWeight.bold,
                    ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          if (onPressed != null)
            Icon(
              Icons.refresh,
              color: iconColor ?? AppColors.black,
              size: iconSize ?? 15.sp,
            ),
        ],
      ),
    );
  }
}

import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedBorderImageWidget extends StatelessWidget {
  final bool withBorder;
  final bool withShadow;
  final double? width;
  final double? height;
  final Widget image;
  final Color? borderColor;
  final Color? shadowColor;
  final double? borderRadius;
  final double? borderWidth;

  const RoundedBorderImageWidget({
    Key? key,
    required this.image,
    this.withBorder = true,
    this.withShadow = true,
    this.borderColor,
    this.shadowColor,
    this.borderRadius = 1000,
    this.borderWidth = 2,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 45.sp,
      height: height ?? 45.sp,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: borderRadius == null ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
        border: withBorder
            ? Border.all(
                color: borderColor ?? AppColors.white,
                width: borderWidth ?? 2.0,
              )
            : null,
        boxShadow: withShadow
            ? [
                BoxShadow(
                    color: shadowColor ?? AppColors.shadowColor,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 8)),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius!)
            : BorderRadius.zero,
        child: AspectRatio(
            aspectRatio: 16 / 9, //aspect ratio for Image
            child: image),
      ),
    );
  }
}

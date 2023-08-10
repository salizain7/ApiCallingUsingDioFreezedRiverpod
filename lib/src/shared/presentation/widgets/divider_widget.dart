import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? height;

  const DividerWidget({
    Key? key,
    this.color,
    this.thickness,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.unselectedTapColor,
      thickness: thickness ?? 1,
      height: height ?? 1,
    );
  }
}

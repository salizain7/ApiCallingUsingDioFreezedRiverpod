import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? radius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function()? onPressed;
  final double? elevation;
  final Color? borderColor;
  final Color? shadowColor;
  final Widget? icon;
  final bool iconFromLeft;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.radius,
    this.horizontalPadding,
    this.verticalPadding,
    this.onPressed,
    this.elevation,
    this.borderColor,
    this.shadowColor,
    this.icon,
    this.iconFromLeft = false,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        elevation: widget.elevation ?? 0,
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ?? 15.sp,
          vertical: widget.verticalPadding ?? 15.sp,
        ),
        backgroundColor: widget.backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: widget.borderColor != null
              ? BorderSide(
                  color: widget.borderColor!,
                )
              : const BorderSide(
                  color: AppColors.transparent,
                ),
          borderRadius: BorderRadius.circular(
            widget.radius ?? 30,
          ),
        ),
        shadowColor: widget.shadowColor ?? AppColors.lightGrayColor,
      ),
      child: _buildChild(),
    );
  }

  // Child of elevation page
  Widget _buildChild() {
    TextStyle textStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        );
    if (widget.icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.iconFromLeft) ...{
            widget.icon!,
            SizedBox(
              width: 5.w,
            ),
            Flexible(
              child: Text(
                widget.text,
                style: widget.textStyle ?? textStyle,
                textAlign: TextAlign.center,
              ),
            ),
          } else ...{
            Flexible(
              child: Text(
                widget.text,
                style: widget.textStyle ?? textStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            widget.icon!,
          }
        ],
      );
    } else {
      return Text(
        widget.text,
        style: widget.textStyle ?? textStyle,
      );
    }
  }
}

import 'package:firstflutter/src/core/helper/helper_ui.dart';
import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:firstflutter/src/shared/presentation/widgets/arrow_back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBarWidget extends StatefulWidget {
  final String title;
  final Function()? callback;
  final Color? backgroundColor;
  final bool hasArrowBack;
  final bool hasImage;
  final String? image;
  final bool hasShadow;
  final TextStyle? titleStyle;

  const DefaultAppBarWidget({
    Key? key,
    required this.title,
    this.callback,
    this.backgroundColor,
    this.hasArrowBack = true,
    this.hasImage = true,
    this.hasShadow = false,
    this.image,
    this.titleStyle,
  }) : super(key: key);

  @override
  State<DefaultAppBarWidget> createState() => _DefaultAppBarWidgetState();
}

class _DefaultAppBarWidgetState extends State<DefaultAppBarWidget> {
  String? image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.primaryColor,
        boxShadow: widget.hasShadow
            ? [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 3,
                    color: AppColors.lightGrayColor.withOpacity(0.1))
              ]
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.sp,
        ),
        child: Column(
          children: [
            SizedBox(
              height: HelperUi.getStatusBarHeight(context),
            ),

            SizedBox(
              height: 15.sp,
            ),

            // Content
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: (!widget.hasArrowBack && !widget.hasImage)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                // Arrow Back Button
                if (widget.hasArrowBack) ...{
                  ArrowBackButtonWidget(
                    iconColor: AppColors.white,
                    callback: widget.callback,
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                },

                // Title
                Flexible(
                  child: Text(
                    widget.title,
                    style: widget.titleStyle ??
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                  width: 5.sp,
                ),


              ],
            ),

            SizedBox(
              height: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}

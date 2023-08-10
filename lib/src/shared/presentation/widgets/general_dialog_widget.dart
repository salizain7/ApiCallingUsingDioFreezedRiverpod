import 'package:firstflutter/src/core/helper/helper_ui.dart';
import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralDialogWidget extends StatefulWidget {
  final Function? callback;
  final EdgeInsets? contentPadding;
  final Widget? image;
  final String header;
  final String? title;
  final String? subTitle;
  final List<Widget>? actions;
  final TextStyle? headerStyle;

  const GeneralDialogWidget({
    Key? key,
    this.contentPadding,
    this.callback,
    required this.header,
    this.title,
    this.subTitle,
    this.image,
    this.actions,
    this.headerStyle,
  }) : super(key: key);

  @override
  State<GeneralDialogWidget> createState() => _GeneralDialogWidgetState();
}

class _GeneralDialogWidgetState extends State<GeneralDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: widget.contentPadding ??
                  EdgeInsets.only(
                    top: 30.h,
                    bottom: 21.h,
                    left: 21.w,
                    right: 21.w,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Verification Code Icon
                  if (widget.image != null) ...{
                    widget.image!,
                    // Space
                    SizedBox(
                      height: HelperUi.getVerticalSpace(),
                    ),
                  },

                  // Header
                  Text(
                    widget.header,
                    style: widget.headerStyle ??
                        Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                    textAlign: TextAlign.center,
                  ),

                  // Space
                  SizedBox(
                    height: HelperUi.getVerticalSpace(),
                  ),

                  // Title
                  if (widget.title != null) ...{
                    Text(
                      widget.title!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),

                    // Space
                    SizedBox(
                      height: HelperUi.getVerticalSpace(),
                    ),
                  },

                  // Sub Title
                  if (widget.subTitle != null) ...{
                    Text(
                      widget.subTitle!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grayColor,
                          ),
                      textAlign: TextAlign.center,
                    ),

                    // Space
                    SizedBox(
                      height: HelperUi.getVerticalSpace(),
                    ),
                  },

                  // Space
                  SizedBox(
                    height: HelperUi.getVerticalSpace(),
                  ),

                  // Done Button
                  if (widget.actions != null) ...{
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < widget.actions!.length; i++) ...{
                          widget.actions![i],
                          if (i != widget.actions!.length - 1) ...{
                            SizedBox(
                              width: 10.sp,
                            ),
                          }
                        }
                      ],
                    )),
                  },
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

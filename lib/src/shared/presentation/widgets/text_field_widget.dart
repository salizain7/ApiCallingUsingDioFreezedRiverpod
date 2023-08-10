import 'package:firstflutter/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final bool? isPassword;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autoValidateMode;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isUnderLineBorder;
  final bool withBorder;
  final bool enabled;
  final bool readOnly;
  final bool enableInteractiveSelection;

  const TextFieldWidget({
    Key? key,
    this.initialValue,
    this.controller,
    this.isPassword,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autoValidateMode,
    this.focusNode,
    this.inputFormatters,
    this.maxLines,
    this.contentPadding,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    this.isUnderLineBorder = true,
    this.withBorder = true,
    this.enabled = true,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    double defaultBorderWidth = 1;
    double defaultBorderRadius = 15;
    Color defaultColor = AppColors.borderColor;
    TextStyle hintStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.lightGrayColor,
        );
    TextStyle errorTextStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.red,
        );
    TextStyle textStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: AppColors.darkFontColor,
        );
    return SizedBox(
      height: widget.height?.h,
      child: TextFormField(
        readOnly: widget.readOnly,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        // textCapitalization: widget.isPassword != null && widget.isPassword!
        //     ? TextCapitalization.none
        //     : TextCapitalization.sentences,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        obscureText: widget.isPassword ?? false,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        validator: widget.validator,
        autovalidateMode:
            widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        style: widget.textStyle ?? textStyle,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          errorStyle: errorTextStyle,
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: const BoxConstraints(),
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: const BoxConstraints(),
          contentPadding: widget.contentPadding ?? EdgeInsets.zero,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? hintStyle,
          disabledBorder: widget.withBorder
              ? widget.isUnderLineBorder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? defaultBorderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
              : InputBorder.none,
          border: widget.withBorder
              ? widget.isUnderLineBorder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? defaultBorderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
              : InputBorder.none,
          enabledBorder: widget.withBorder
              ? widget.isUnderLineBorder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? defaultBorderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
              : InputBorder.none,
          errorBorder: widget.withBorder
              ? widget.isUnderLineBorder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? defaultBorderRadius),
                      borderSide: const BorderSide(
                        color: AppColors.red,
                        width: 2,
                      ),
                    )
              : InputBorder.none,
          focusedErrorBorder: widget.withBorder
              ? widget.isUnderLineBorder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? defaultBorderRadius),
                      borderSide: const BorderSide(
                        color: AppColors.red,
                        width: 2,
                      ),
                    )
              : InputBorder.none,
          focusedBorder: widget.withBorder
              ? widget.isUnderLineBorder
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? defaultBorderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? defaultColor,
                        width: widget.borderWidth ?? defaultBorderWidth,
                      ),
                    )
              : InputBorder.none,
        ),
      ),
    );
  }
}

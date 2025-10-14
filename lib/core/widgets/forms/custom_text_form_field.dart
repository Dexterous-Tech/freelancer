import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.fillBackgroundColor,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.obscureText,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.labelStyle,
    this.labelText,
    this.onTap,
    this.radius,
    this.maxLines,
    this.onChanged,
    this.borderColor,
    this.inputFormatters,
    this.style,
    this.readOnly = false,
    this.errorStyle,
    this.errorText,
    this.enableInteractiveSelection,
    this.contextMenuBuilder,
  });

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillBackgroundColor;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;
  final String? labelText;
  final void Function()? onTap;
  final double? radius;
  final int? maxLines;
  final void Function(String)? onChanged;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final bool readOnly;
  final TextStyle? errorStyle;
  final String? errorText;
  final bool? enableInteractiveSelection;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style ?? AppTextStyles.font16DarkBlueRegular,
      obscureText: obscureText ?? false,
      controller: controller,
      readOnly: readOnly,
      validator: (value) {
        return validator(value);
      },
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChanged,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      enableInteractiveSelection: enableInteractiveSelection,
      contextMenuBuilder: contextMenuBuilder,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.font14GrayMedium,
        labelText: labelText,
        labelStyle: labelStyle ?? AppTextStyles.font14GrayMedium,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 19.h),
        filled: true,
        fillColor: fillBackgroundColor ?? AppColors.white,
        errorMaxLines: 3,
        // RTL error text styling
        errorStyle: errorStyle ?? TextStyle(fontSize: 12.sp, color: Colors.red),
        errorText: errorText, // removes default error
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8).r,
              borderSide: BorderSide(
                color: borderColor ?? AppColors.philippineSilver,
              ),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8).r,
              borderSide: BorderSide(color: borderColor ?? AppColors.darkBlue),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8).r,
              borderSide: BorderSide(color: borderColor ?? AppColors.darkBlue),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8).r,
              borderSide: const BorderSide(color: Colors.red),
            ),
        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 16).r,
              borderSide: BorderSide(color: borderColor ?? AppColors.darkBlue),
            ),
      ),
    );
  }
}

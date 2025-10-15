import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
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
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final TextEditingController _controller;
  late bool _isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _isNotEmpty = _controller.text.isNotEmpty;

    _controller.addListener(() {
      final newState = _controller.text.isNotEmpty;
      if (newState != _isNotEmpty) {
        setState(() => _isNotEmpty = newState);
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(widget.radius ?? 8).r;

    return TextFormField(
      style: widget.style ?? AppTextStyles.font16DarkBlueRegular,
      obscureText: widget.obscureText ?? false,
      controller: _controller,
      readOnly: widget.readOnly,
      validator: (value) => widget.validator(value),
      onTap: widget.onTap,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines ?? 1,
      inputFormatters: widget.inputFormatters,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      contextMenuBuilder: widget.contextMenuBuilder,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? AppTextStyles.font14GrayMedium,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle ?? AppTextStyles.font14GrayMedium,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        isDense: true,
        contentPadding:
            widget.contentPadding ??
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 19.h),
        filled: true,
        fillColor: widget.fillBackgroundColor ?? AppColors.white,
        errorMaxLines: 3,
        errorStyle:
            widget.errorStyle ?? TextStyle(fontSize: 12.sp, color: Colors.red),
        errorText: widget.errorText,
        border:
            widget.border ??
            OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.philippineSilver,
              ),
            ),
        focusedBorder:
            widget.focusedBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.darkBlue,
              ),
            ),
        enabledBorder:
            widget.enabledBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                // 👇 dynamic border color based on text content
                color: _isNotEmpty
                    ? AppColors.darkBlue
                    : AppColors.philippineSilver,
              ),
            ),
        errorBorder:
            widget.errorBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(color: Colors.red),
            ),
        focusedErrorBorder:
            widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.darkBlue,
              ),
            ),
      ),
    );
  }
}

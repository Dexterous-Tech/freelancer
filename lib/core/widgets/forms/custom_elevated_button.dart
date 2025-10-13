import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.paddingButton,
    required this.onPressed,
    this.textButton,
    this.styleTextButton,
    this.backgroundColor,
    this.horizontalPadding,
    this.buttonWidget,
    this.verticalPadding,
    this.border,
    this.radius,
    this.height,
    this.width,
  });

  final EdgeInsetsGeometry? paddingButton;
  final void Function() onPressed;
  final String? textButton;

  final TextStyle? styleTextButton;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? buttonWidget;
  final BoxBorder? border;
  final double? radius;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? double.infinity, height ?? 60.h),
        backgroundColor: backgroundColor ?? AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          side: BorderSide.none,
        ),
      ),
      onPressed: onPressed,
      child:
          buttonWidget ??
          Center(
            child: Text(
              textButton ?? '',
              textAlign: TextAlign.center,
              style: styleTextButton ?? AppTextStyles.font18YellowRegular,
            ),
          ),
    );
  }
}

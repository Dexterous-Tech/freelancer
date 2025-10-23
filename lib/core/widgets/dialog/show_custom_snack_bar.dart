import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, {
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: AppTextStyles.font14GrayMedium.copyWith(
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: backgroundColor ?? AppColors.darkBlue,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      duration: Duration(seconds: 1),
    ),
  );
}

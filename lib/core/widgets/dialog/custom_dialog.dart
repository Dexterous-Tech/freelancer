import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelancer/core/theme/app_colors.dart';

Future customDialog({
  required BuildContext context,
  required Widget dialogContent,
  double? height,
  double? width,
  double? radius,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
}) async {
  final result = await showDialog(
    barrierColor: AppColors.black.withValues(alpha: 0.6),
    context: context,
    barrierDismissible: false,
    builder: (context) => PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context, true); // Always pop with true
        }
      },
      child: _buildDialogContent(
        context: context,
        dialogContent: dialogContent,
        height: height,
        width: width,
        radius: radius,
        padding: padding,
        backgroundColor: backgroundColor,
      ),
    ),
  );

  return result ?? false;
}

Widget _buildDialogContent({
  required BuildContext context,
  required Widget dialogContent,
  double? height,
  double? width,
  double? radius,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius ?? 16).r,
    ),
    backgroundColor: Colors.transparent,
    child: FittedBox(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Close keyboard
        },
        child: Container(
          width: width ?? 370.w,
          height: height,
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius ?? 16).r,
            ),
          ),
          child: dialogContent,
        ),
      ),
    ),
  );
}

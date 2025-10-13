import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../helper/app_lottie.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/spacing.dart';
import '../forms/custom_elevated_button.dart';
import 'custom_dialog.dart';

void successDialog({
  required BuildContext context,
  required String message,
  required void Function()? onPressed,
}) {
  customDialog(
    context: context,
    backgroundColor: AppColors.white,
    dialogContent: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(AppLottie.successLottie, width: 200.w, height: 150.h),
        verticalSpace(15),
        Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.font16BlackSemiBold,
          ),
        ),
        verticalSpace(15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onPressed: onPressed ?? () {},
              textButton: 'Continue',
            ),
          ),
        ),
      ],
    ),
  );
}

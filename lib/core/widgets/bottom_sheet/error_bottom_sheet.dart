import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/app_lottie.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import 'package:lottie/lottie.dart';

class ErrorBottomSheet extends StatelessWidget {
  const ErrorBottomSheet({
    super.key,
    required this.error,
    this.onPressed,
    this.textButton,
  });

  final String error;
  final void Function()? onPressed;
  final String? textButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Lottie.asset(
            AppLottie.errorLottie,
            width: 150.w,
            height: 150.h,
          ),
        ),
        verticalSpace(16),
        Center(
          child: Text(
            error,
            style: AppTextStyles.font18YellowRegular.copyWith(
              color: AppColors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(16),
        CustomBottomButton(
          onPressed:
              onPressed ??
              () {
                context.pop();
              },
          buttonColor: AppColors.red,
          buttonTextStyle: AppTextStyles.font18WhiteMedium,
          textButton: textButton ?? LocaleKeys.tryAgain.tr(),
        ),
      ],
    );
  }
}

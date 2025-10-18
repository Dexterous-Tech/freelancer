import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/locale_keys.g.dart';
import '../../helper/app_lottie.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/spacing.dart';
import '../custom_bottom_button.dart';

class CorrectBottomSheet extends StatelessWidget {
  const CorrectBottomSheet({super.key, required this.message, this.onPressed});

  final String message;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Lottie.asset(
            AppLottie.successLottie,
            width: 150.w,
            height: 150.h,
          ),
        ),
        verticalSpace(16),
        Center(
          child: Text(
            message,
            style: AppTextStyles.font18YellowRegular.copyWith(
              color: AppColors.darkBlue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(16),
        CustomBottomButton(
          onPressed: onPressed,
          textButton: LocaleKeys.continueButton.tr(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:lottie/lottie.dart';

import '../../helper/app_lottie.dart';
import '../../theme/app_colors.dart';
import 'custom_dialog.dart';

void loadingDialog(BuildContext context) {
  customDialog(
    context: context,
    backgroundColor: AppColors.white,
    dialogContent: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppLottie.loadingLottie),
          verticalSpace(16),
          Text('Loading...', style: AppTextStyles.font16DarkBlueRegular),
        ],
      ),
    ),
  );
}

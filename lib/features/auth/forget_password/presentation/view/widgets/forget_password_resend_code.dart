import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../manager/forget_password_cubit.dart';

class ForgetPasswordResendCode extends StatelessWidget {
  const ForgetPasswordResendCode({super.key});

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        final cubit = ForgetPasswordCubit.get(context);
        final bool isTimerActive = cubit.remainingSeconds > 0;
        final String formattedTime = _formatTime(cubit.remainingSeconds);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ===== TIMER TEXT =====
            Center(
              child: Text(
                formattedTime,
                style: AppTextStyles.font18YellowRegular.copyWith(
                  color: isTimerActive
                      ? AppColors.darkBlue
                      : AppColors.philippineSilver,
                ),
              ),
            ),

            verticalSpace(16),

            // ===== RESEND BUTTON =====
            CustomElevatedButton(
              onPressed: isTimerActive
                  ? () {} // 🔸 disable when timer is active
                  : () {
                      cubit.resendCode();
                    }, // disable while counting down
              textButton: LocaleKeys.authentication_resendAgain.tr(),
              styleTextButton: AppTextStyles.font18YellowRegular.copyWith(
                color: !isTimerActive
                    ? AppColors.yellow
                    : AppColors.philippineSilver,
              ),
              backgroundColor: !isTimerActive
                  ? AppColors.darkBlue
                  : AppColors.independence,
            ),
          ],
        );
      },
    );
  }
}

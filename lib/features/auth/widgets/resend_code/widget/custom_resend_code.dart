import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/widgets/bottom_sheet/error_bottom_sheet.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/spacing.dart';
import '../../../../../core/widgets/forms/custom_elevated_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../manager/resend_code_cubit.dart';

class CustomResendCode extends StatefulWidget {
  const CustomResendCode({
    super.key,
    required this.countryCode,
    required this.phone,
  });

  final String countryCode;
  final String phone;

  @override
  State<CustomResendCode> createState() => _CustomResendCodeState();
}

class _CustomResendCodeState extends State<CustomResendCode> {
  @override
  void initState() {
    ResendCodeCubit.get(context).startTimer();
    super.initState();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResendCodeCubit, ResendCodeState>(
      buildWhen: (previous, current) =>
          current is ResendCodeLoading ||
          current is ResendCodeSuccess ||
          current is ResendCodeFailure ||
          current is ResendCodeTimerUpdated ||
          current is ResendCodeTimerFinished,

      listenWhen: (previous, current) =>
          current is ResendCodeLoading ||
          current is ResendCodeSuccess ||
          current is ResendCodeFailure ||
          current is ResendCodeTimerUpdated ||
          current is ResendCodeTimerFinished,
      listener: (context, state) {
        if (state is ResendCodeFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
      },
      builder: (context, state) {
        final cubit = ResendCodeCubit.get(context);
        final bool isTimerActive = cubit.remainingSeconds > 0;
        final String formattedTime = _formatTime(cubit.remainingSeconds);
        final loading = state is ResendCodeLoading;
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
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onPressed: isTimerActive
                    ? () {} // 🔸 disable when timer is active
                    : () {
                        cubit.resendCode(
                          countryCode: widget.countryCode,
                          phone: widget.phone,
                        );
                      }, // disable while counting down
                textButton: LocaleKeys.authentication_resendAgain.tr(),
                buttonWidget: loading
                    ? CircularProgressIndicator(color: AppColors.yellow)
                    : null,
                styleTextButton: AppTextStyles.font18YellowRegular.copyWith(
                  color: !isTimerActive
                      ? AppColors.yellow
                      : AppColors.philippineSilver,
                ),
                backgroundColor: !isTimerActive
                    ? AppColors.darkBlue
                    : AppColors.independence,
              ),
            ),
          ],
        );
      },
    );
  }
}

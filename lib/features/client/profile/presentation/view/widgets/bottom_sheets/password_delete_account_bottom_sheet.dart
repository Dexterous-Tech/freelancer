import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/spacing.dart';
import '../../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../auth/widgets/custom_password_text_form_field.dart';

class PasswordDeleteAccountBottomSheet extends StatefulWidget {
  const PasswordDeleteAccountBottomSheet({super.key});

  @override
  State<PasswordDeleteAccountBottomSheet> createState() =>
      _PasswordDeleteAccountBottomSheetState();
}

class _PasswordDeleteAccountBottomSheetState
    extends State<PasswordDeleteAccountBottomSheet> {
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LocaleKeys.profile_enterPasswordTitle.tr(),
                style: AppTextStyles.font20YellowMedium.copyWith(
                  color: AppColors.jet,
                ),
              ),
              verticalSpace(8),
              Text(
                LocaleKeys.profile_enterPasswordSubtitle.tr(),
                style: AppTextStyles.font14OuterSpaceMedium.copyWith(
                  color: AppColors.davyGrey,
                ),
              ),
              verticalSpace(24),
              CustomPasswordTextFormField(
                passwordController: passwordController,
                obscureText: obscureText,
                hint: LocaleKeys.authentication_currentPassword.tr(),
                onToggleVisibility: () {
                  setState(() => obscureText = !obscureText);
                },
              ),
              verticalSpace(16),
            ],
          ),
        ),
        CustomBottomButton(
          isMore: true,
          firstButtonColor: AppColors.cgRed,
          secondButtonColor: AppColors.aliceBlue,
          firstButtonText: LocaleKeys.profile_deleteAccount.tr(),
          secondButtonText: LocaleKeys.back.tr(),
          firstButtonTextStyle: AppTextStyles.font18WhiteMedium,
          secondButtonTextStyle: AppTextStyles.font18WhiteMedium.copyWith(
            color: AppColors.darkBlue,
          ),
          firstButtonOnPressed: () {},
          secondButtonOnPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}

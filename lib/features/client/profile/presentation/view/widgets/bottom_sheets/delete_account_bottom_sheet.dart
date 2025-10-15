import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/features/client/profile/presentation/view/widgets/bottom_sheets/password_delete_account_bottom_sheet.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/spacing.dart';
import '../../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

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
                LocaleKeys.profile_deleteAccount.tr(),
                style: AppTextStyles.font24WhiteMedium.copyWith(
                  color: AppColors.charlestonGreen,
                ),
              ),
              verticalSpace(8),
              Text(
                LocaleKeys.profile_sureDelete.tr(),
                style: AppTextStyles.font14OuterSpaceMedium,
              ),
              verticalSpace(25),
            ],
          ),
        ),
        CustomBottomButton(
          isMore: true,
          firstButtonColor: AppColors.red,
          secondButtonColor: AppColors.antiFlashWhite,
          firstButtonText: LocaleKeys.profile_deleteAccount.tr(),
          secondButtonText: LocaleKeys.back.tr(),
          firstButtonTextStyle: AppTextStyles.font18YellowRegular.copyWith(
            color: AppColors.white,
          ),
          secondButtonTextStyle: AppTextStyles.font18YellowRegular.copyWith(
            color: AppColors.darkBlue,
          ),
          firstButtonOnPressed: () {
            openBottomSheet(
              context: context,
              bottomSheetContent: PasswordDeleteAccountBottomSheet(),
            );
          },
          secondButtonOnPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}

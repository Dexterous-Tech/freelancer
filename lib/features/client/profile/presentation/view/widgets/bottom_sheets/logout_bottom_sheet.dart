import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';

import '../../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

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
                LocaleKeys.profile_logout.tr(),
                style: AppTextStyles.font24WhiteMedium.copyWith(
                  color: AppColors.charlestonGreen,
                ),
              ),
              verticalSpace(8),
              Text(
                LocaleKeys.profile_sureLogout.tr(),
                style: AppTextStyles.font14OuterSpaceMedium,
              ),
              verticalSpace(25),
            ],
          ),
        ),
        CustomBottomButton(
          isMore: true,
          firstButtonColor: AppColors.darkBlue,
          secondButtonColor: AppColors.antiFlashWhite,
          firstButtonText: LocaleKeys.profile_logout.tr(),
          secondButtonText: LocaleKeys.back.tr(),
          firstButtonTextStyle: AppTextStyles.font18YellowRegular,
          secondButtonTextStyle: AppTextStyles.font18YellowRegular.copyWith(
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

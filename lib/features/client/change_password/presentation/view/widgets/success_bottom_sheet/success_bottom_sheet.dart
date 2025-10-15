import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({super.key});

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
              Row(
                children: [
                  Text(
                    LocaleKeys.profile_completeSuccessfully.tr(),
                    style: AppTextStyles.font24WhiteMedium.copyWith(
                      color: AppColors.charlestonGreen,
                    ),
                  ),
                  horizontalSpace(8),
                  SvgPicture.asset(
                    AppImages.correctIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
              verticalSpace(8),
              Text(
                LocaleKeys.profile_passwordChangesSuccessfully.tr(),
                style: AppTextStyles.font14OuterSpaceMedium,
              ),
              verticalSpace(18),
              Center(
                child: Image.asset(
                  AppImages.successImage,
                  width: 88.w,
                  height: 88.h,
                ),
              ),
              verticalSpace(28),
            ],
          ),
        ),
        CustomBottomButton(textButton: LocaleKeys.save.tr()),
      ],
    );
  }
}

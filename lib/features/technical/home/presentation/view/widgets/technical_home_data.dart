import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';
import 'package:freelancer/core/widgets/phone_number_text.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/helper/app_images.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/gradiant_image_border.dart';

class TechnicalHomeData extends StatelessWidget {
  const TechnicalHomeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16).r,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            offset: Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            offset: Offset(0, 1),
            spreadRadius: 0,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientImageBorder(
            image: AppImages.personImage,
            size: 64,
            isGradient: false,
            color: AppColors.cultured,
          ),
          verticalSpace(8),
          Text('احمد ناصر', style: AppTextStyles.font20BlackOliveRegular),
          PhoneNumberText(),
          Row(
            children: [
              Text('4.7 (216)', style: AppTextStyles.font14OuterSpaceMedium),
              horizontalSpace(2),
              SvgPicture.asset(
                AppImages.starBoldIcon,
                width: 18.w,
                height: 18.h,
              ),
            ],
          ),
          verticalSpace(8),
          Row(children: [badgeItem(), horizontalSpace(4), jobItem()]),
          verticalSpace(24),
          CustomElevatedButton(
            onPressed: () {},
            backgroundColor: AppColors.antiFlashWhite,
            styleTextButton: AppTextStyles.font16DarkBlueRegular,
            textButton: LocaleKeys.technical_askBadge.tr(),
          ),
        ],
      ),
    );
  }

  Widget jobItem() {
    return Container(
      height: 26.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: AppColors.cultured,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.jobIcon, width: 16.w, height: 16.h),
          horizontalSpace(4),
          Text(
            'سباك صحي',
            style: AppTextStyles.font12DarkBlueMedium.copyWith(
              color: AppColors.outerSpace,
            ),
          ),
        ],
      ),
    );
  }

  Widget badgeItem() {
    return Container(
      height: 26.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: AppColors.nyanza,
      ),
      child: Center(
        child: Text(
          'Special',
          style: AppTextStyles.font12DarkBlueMedium.copyWith(
            color: AppColors.japaneseLaurel,
          ),
        ),
      ),
    );
  }
}

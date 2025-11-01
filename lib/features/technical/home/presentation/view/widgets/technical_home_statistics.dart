import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/theme/app_colors.dart';

class TechnicalHomeStatistics extends StatelessWidget {
  const TechnicalHomeStatistics({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.technical_statistics.tr(),
            style: AppTextStyles.font16JetMedium,
          ),
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              statisticsItem(isView: true, item: '85'),
              statisticsItem(isView: false, item: '78'),
            ],
          ),
        ],
      ),
    );
  }

  Widget statisticsItem({required bool isView, required String item}) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isView ? AppColors.mistyRose : AppColors.lavender,
          ),
          child: Center(
            child: SvgPicture.asset(
              isView ? AppImages.redEyeIcon : AppImages.lavenderStarIcon,
            ),
          ),
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item,
              style: AppTextStyles.font14OuterSpaceSemiBold.copyWith(
                color: AppColors.jet,
              ),
            ),
            Text(
              isView
                  ? LocaleKeys.technical_numberViews.tr()
                  : LocaleKeys.technical_reviews.tr(),
              style: AppTextStyles.font12DarkBlueMedium.copyWith(
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

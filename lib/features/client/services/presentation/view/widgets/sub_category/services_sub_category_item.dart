import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';

class ServicesSubCategoryItem extends StatelessWidget {
  const ServicesSubCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.subCategoryItemIcon,
            width: 40.w,
            height: 40.h,
          ),
          verticalSpace(16),
          Text(
            'Sub category name',
            style: AppTextStyles.font14OuterSpaceSemiBold,
          ),
        ],
      ),
    );
  }
}

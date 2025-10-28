import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';

class ServicesCategoryItem extends StatelessWidget {
  const ServicesCategoryItem({
    super.key,
    required this.isActive,
    this.onTap,
    this.isIcon = true,
  });
  final bool isActive;
  final void Function()? onTap;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          color: isActive ? AppColors.yellow : AppColors.cultured,
        ),
        child: Row(
          children: [
            if (isIcon) ...[
              SvgPicture.asset(
                AppImages.categoryItemIcon,
                width: 20.w,
                height: 18.h,
                colorFilter: ColorFilter.mode(
                  isActive
                      ? AppColors.darkBlue
                      : AppColors.graniteGray, // desired color
                  BlendMode.srcIn, // replaces original color
                ),
              ),
              horizontalSpace(4),
            ],
            Text(
              'Category Name',
              style: AppTextStyles.font12DarkBlueMedium.copyWith(
                color: isActive ? AppColors.darkBlue : AppColors.graniteGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

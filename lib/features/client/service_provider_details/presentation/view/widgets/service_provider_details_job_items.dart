import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';

class ServiceProviderDetailsJobItems extends StatelessWidget {
  const ServiceProviderDetailsJobItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return const ServiceProviderDetailsJobItem();
        },
        separatorBuilder: (context, index) => horizontalSpace(8),
      ),
    );
  }
}

class ServiceProviderDetailsJobItem extends StatelessWidget {
  const ServiceProviderDetailsJobItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: AppColors.antiFlashWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.jobIcon,
            width: 18.w,
            height: 18.h,
            colorFilter: const ColorFilter.mode(
              AppColors.darkBlue, // 🔵 Desired color
              BlendMode.srcIn,
            ),
          ),
          horizontalSpace(4),
          Text('job', style: AppTextStyles.font12DarkBlueMedium),
        ],
      ),
    );
  }
}

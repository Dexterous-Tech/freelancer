import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/helper/extensions.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/spacing.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, this.isBack = true});

  final String title;
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.yellow, AppColors.white],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24).r,
          bottomRight: Radius.circular(24).r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(44),
          Row(
            children: [
              if (isBack) ...[
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    AppImages.arrowRightBlackIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                horizontalSpace(16),
              ],
              Text(title, style: AppTextStyles.font16JetMedium),
            ],
          ),
        ],
      ),
    );
  }
}

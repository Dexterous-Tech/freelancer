import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/helper/localization_service.dart';

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
        gradient: LinearGradient(
          begin: Alignment(0, -3),
          end: Alignment(0, 0),
          colors: [AppColors.yellow, AppColors.white],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            spreadRadius: 2,
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
                  child: Transform.rotate(
                    angle: LocalizationService.isEnglish(context) ? math.pi : 0,
                    child: SvgPicture.asset(
                      AppImages.arrowRightBlackIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
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

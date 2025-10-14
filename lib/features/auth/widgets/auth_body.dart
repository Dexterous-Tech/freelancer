import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/localization_service.dart';

import '../../../core/helper/app_images.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/spacing.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.title,
    required this.subTitle,
    required this.authBodyContent,
    this.isBack = true,
  });

  final String title;
  final String subTitle;
  final Widget authBodyContent;
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isBack) ...[
              Transform.rotate(
                angle: LocalizationService.isEnglish(context) ? math.pi : 0,
                child: SvgPicture.asset(
                  AppImages.arrowRight,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              verticalSpace(24),
            ],
            Row(
              children: [
                Image.asset(AppImages.appLogo, width: 54.w, height: 34.h),
                horizontalSpace(8),
                Image.asset(
                  AppImages.freelancerLogo,
                  width: 135.w,
                  height: 20.h,
                ),
              ],
            ),
            verticalSpace(32),
            Text(title, style: AppTextStyles.font30OuterSpaceRegular),
            verticalSpace(8),
            Text(subTitle, style: AppTextStyles.font16DavyGrayRegular),
            verticalSpace(32),
            authBodyContent,
          ],
        ),
      ),
    );
  }
}

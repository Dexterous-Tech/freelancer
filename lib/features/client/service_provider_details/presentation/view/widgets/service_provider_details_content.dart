import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_country_flag.dart';
import 'package:freelancer/core/widgets/gradiant_icon_border.dart';
import 'package:freelancer/core/widgets/gradiant_image_border.dart';
import 'service_provider_details_social_media.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import 'service_provider_details_languages.dart';
import 'service_provider_details_location.dart';
import 'service_provider_details_job_items.dart';
import 'dart:ui' as ui show TextDirection;

class ServiceProviderDetailsContent extends StatelessWidget {
  const ServiceProviderDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GradientImageBorder(image: AppImages.serviceProviderImage),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nameAndNationalityData(),
                  verticalSpace(4),
                  reviewAndViewsData(),
                ],
              ),
              Spacer(),
              GradiantIconBorder(
                assetName: AppImages.favBorderIcon,
                colorFilter: const ColorFilter.mode(
                  AppColors.darkBlue, // 🔵 Desired color
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          verticalSpace(32),
          ServiceProviderDetailsJobItems(),
          verticalSpace(32),
          ServiceProviderDetailsLocation(),
          verticalSpace(24),
          phoneNumber(),
          verticalSpace(24),
          ServiceProviderDetailsLanguages(),
          verticalSpace(24),
          aboutTechnical(),
          verticalSpace(24),
          ServiceProviderDetailsSocialMedia(),
          verticalSpace(24),
        ],
      ),
    );
  }

  Widget nameAndNationalityData() {
    return Row(
      children: [
        Text(
          'احمد سلطان',
          style: AppTextStyles.font16JetMedium.copyWith(
            color: AppColors.outerSpace,
          ),
        ),
        horizontalSpace(8),
        Transform.rotate(
          angle: math.pi / 2,
          child: Container(width: 23.w, height: 1.h, color: AppColors.darkBlue),
        ),
        horizontalSpace(8),
        CustomCountryFlag(countryCode: 'EG'),
        horizontalSpace(18),
        Text(
          'مصري',
          style: AppTextStyles.font12DarkBlueMedium.copyWith(
            color: AppColors.graniteGray,
          ),
        ),
      ],
    );
  }

  Widget reviewAndViewsData() {
    return Row(
      children: [
        SvgPicture.asset(AppImages.starBoldIcon, width: 18.w, height: 18.h),
        horizontalSpace(2),
        Text(
          '4.7 (216)',
          style: AppTextStyles.font14DarkLiverMedium.copyWith(
            color: AppColors.graniteGray,
          ),
        ),
        horizontalSpace(8),
        SvgPicture.asset(AppImages.eyeGrayIcon, width: 16.w, height: 16.h),
        horizontalSpace(2),
        Text(
          '212',
          style: AppTextStyles.font14DarkLiverMedium.copyWith(
            color: AppColors.graniteGray,
          ),
        ),
      ],
    );
  }

  Widget phoneNumber() {
    String countryCode = '+966';
    // Remove any + signs and add one at the start
    countryCode = '+${countryCode.replaceAll('+', '')}';
    String phone = '50 123 4567';
    String phoneNumber = '$countryCode $phone';
    return Row(
      children: [
        SvgPicture.asset(AppImages.phoneIcon, width: 20.w, height: 20.h),
        horizontalSpace(4),
        Text(
          phoneNumber,
          style: AppTextStyles.font14OuterSpaceMedium,
          textDirection: ui.TextDirection.ltr,
        ),
      ],
    );
  }

  Widget aboutTechnical() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.services_aboutTechnical.tr(),
          style: AppTextStyles.font12OuterSpaceSemiBold.copyWith(
            color: AppColors.jet,
          ),
        ),
        verticalSpace(8),
        Text(
          'أنا نجار أعشق الخشب وأعتبره رفيق شغلي وحياتي أحوّل القطع الخام لفرش وأثاث يعيش عمر طويل ويزين البيوت.',
          style: AppTextStyles.font14BlackRegular.copyWith(
            color: AppColors.charlestonGreen,
          ),
        ),
      ],
    );
  }
}

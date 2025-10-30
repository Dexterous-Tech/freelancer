import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ServiceProviderDetailsLocation extends StatelessWidget {
  const ServiceProviderDetailsLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customLocationItem(location: 'الرياض'),
            customLocationItem(location: 'جدة', isMain: false),
          ],
        ),
        verticalSpace(8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8).r,
          child: Image.asset(
            AppImages.mapServiceImage,
            width: double.infinity,
            height: 132.h,
          ),
        ),
      ],
    );
  }

  Widget customLocationItem({required String location, bool isMain = true}) {
    return Row(
      children: [
        SvgPicture.asset(
          isMain ? AppImages.mainLocationIcon : AppImages.currentLocationIcon,
          width: 20.w,
          height: 20.h,
        ),
        horizontalSpace(4),
        Text(
          location,
          style: AppTextStyles.font12DarkBlueMedium.copyWith(
            color: AppColors.outerSpace,
          ),
        ),
        horizontalSpace(4),
        Text(
          '(${isMain ? LocaleKeys.services_mainAddress.tr() : LocaleKeys.services_currentLocation.tr()})',
          style: AppTextStyles.font12DarkBlueRegular.copyWith(
            color: AppColors.jet,
          ),
        ),
      ],
    );
  }
}

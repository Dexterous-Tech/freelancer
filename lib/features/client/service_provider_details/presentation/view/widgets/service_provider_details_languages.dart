import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ServiceProviderDetailsLanguages extends StatelessWidget {
  const ServiceProviderDetailsLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.services_languages.tr(),
          style: AppTextStyles.font12OuterSpaceSemiBold.copyWith(
            color: AppColors.jet,
          ),
        ),
        verticalSpace(8),
        Row(
          children: [
            SizedBox(
              width: 45.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 24 / 2,
                    bottom: 0,
                    child: customLanguageLogo(logo: AppImages.englishLogo),
                  ),
                  customLanguageLogo(logo: AppImages.arabicLogo),
                ],
              ),
            ),
            horizontalSpace(8),
            Text(
              'العربية و الانجليزيه',
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: AppColors.charlestonGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget customLanguageLogo({required String logo}) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(logo, fit: BoxFit.cover),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/gradiant_icon_border.dart';
import 'package:freelancer/core/widgets/gradiant_image_border.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/theme/app_colors.dart';

class TechnicalHomeHeader extends StatelessWidget {
  const TechnicalHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      width: double.infinity,
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
          verticalSpace(40),
          Row(
            children: [
              GradientImageBorder(
                image: AppImages.personImage,
                size: 48,
                isGradient: false,
                color: AppColors.cultured,
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'احمد ناصر',
                    style: AppTextStyles.font20BlackOliveRegular,
                  ),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.technical_welcomeBack.tr(),
                        style: AppTextStyles.font14BlackRegular.copyWith(
                          color: AppColors.sonicSilver,
                        ),
                      ),
                      horizontalSpace(10),
                      Image.asset(
                        AppImages.wavingHandImage,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              GradiantIconBorder(assetName: AppImages.notificationIcon),
            ],
          ),
        ],
      ),
    );
  }
}

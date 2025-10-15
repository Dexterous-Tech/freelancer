import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/on_boarding/presentation/view/widgets/on_boarding_language.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(AppImages.backgroundLogo),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 25.w,
            end: 23.w,
            top: 78.h,
            bottom: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.on_boarding_welcome.tr(),
                style: AppTextStyles.font30WhiteSemiBold,
              ),
              Text(
                LocaleKeys.on_boarding_requestTechnician.tr(),
                style: AppTextStyles.font30WhiteSemiBold,
              ),
              verticalSpace(16),
              Text(
                LocaleKeys.on_boarding_nearbyTechnicians.tr(),
                style: AppTextStyles.font18YellowRegular.copyWith(
                  color: AppColors.white,
                ),
              ),
              Spacer(),
              OnBoardingLanguage(
                onLanguageChanged: () {
                  setState(() {}); // Rebuild parent when language changes
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

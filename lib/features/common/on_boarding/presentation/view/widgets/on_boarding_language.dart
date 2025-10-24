import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/services/localization_service.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/shared/shared_preferences_helper.dart';
import 'package:freelancer/core/shared/shared_preferences_key.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/networking/dio_factory.dart';

class OnBoardingLanguage extends StatefulWidget {
  final VoidCallback? onLanguageChanged;

  const OnBoardingLanguage({super.key, this.onLanguageChanged});

  @override
  State<OnBoardingLanguage> createState() => _OnBoardingLanguageState();
}

class _OnBoardingLanguageState extends State<OnBoardingLanguage> {
  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale.languageCode;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16).r,
      child: Stack(
        children: [
          /// Background Blur Layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(color: Colors.transparent),
          ),

          /// Gradient Overlay Layer (matches Figma progressive blur style)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).r,

              gradient: LinearGradient(
                begin: Alignment(0.82, -0.09), // X start 82.27%, Y start -9.03%
                end: Alignment(0.46, 0.72), // X end 46.4%, Y end 71.99%
                colors: [
                  AppColors.black.withValues(alpha: 0.3),
                  AppColors.black.withValues(alpha: 0.3),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 134.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: AppColors.policeBlue,
                      borderRadius: BorderRadius.circular(100).r,
                    ),
                  ),
                ),
                verticalSpace(32),
                Text(
                  LocaleKeys.on_boarding_selectLanguage.tr(),
                  style: AppTextStyles.font24WhiteMedium,
                ),
                verticalSpace(8),

                /// Arabic
                languageItem(
                  context: context,
                  code: 'ar',
                  logo: AppImages.arabicLogo,
                  language: LocaleKeys.on_boarding_arabicLanguage.tr(),
                  isSelected: currentLocale == 'ar',
                ),
                verticalSpace(8),

                /// English
                languageItem(
                  context: context,
                  code: 'en',
                  logo: AppImages.englishLogo,
                  language: LocaleKeys.on_boarding_englishLanguage.tr(),
                  isSelected: currentLocale == 'en',
                ),
                verticalSpace(8),

                /// Urdu
                languageItem(
                  context: context,
                  code: 'ur',
                  logo: AppImages.urduLogo,
                  language: LocaleKeys.on_boarding_urduLanguage.tr(),
                  isSelected: currentLocale == 'ur',
                ),
                verticalSpace(28),

                CustomElevatedButton(
                  onPressed: () {
                    context.pushReplacementNamed(AppRoutes.loginScreen);
                  },
                  backgroundColor: AppColors.yellow,
                  buttonWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.next.tr(),
                        style: AppTextStyles.font18YellowRegular.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      horizontalSpace(8),
                      Transform.rotate(
                        angle: LocalizationService.isEnglish(context)
                            ? math.pi
                            : 0,
                        child: SvgPicture.asset(
                          AppImages.arrowLeft,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget languageItem({
    required BuildContext context,
    required String code,
    required String logo,
    required String language,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () async {
        await context.setLocale(Locale(code));
        await SharedPreferencesHelper.setSecuredString(
          SharedPreferencesKey.currentCodeKey,
          code,
        );
        log("save language code $code");
        await DioFactory.updateLanguageHeader(code);
        setState(() {}); // Trigger rebuild of this widget
        widget.onLanguageChanged?.call(); // Notify parent to rebuild
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100).r,
              child: Image.asset(logo, width: 40.w, height: 40.h),
            ),
            horizontalSpace(8),
            Text(
              language,
              style: AppTextStyles.font18YellowRegular.copyWith(
                color: AppColors.white,
              ),
            ),
            const Spacer(),
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: isSelected ? Colors.transparent : AppColors.cultured,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.yellow : AppColors.lightGray,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.chineseBlack.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 14.w,
                        height: 14.h,
                        decoration: const BoxDecoration(
                          color: AppColors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

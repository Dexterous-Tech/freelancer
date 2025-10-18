import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';

import '../../../../../../core/helper/app_images.dart';
import '../../../../../../core/helper/localization_service.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/font_weight_helper.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../client/widgets/profile_content_item.dart';
import 'change_language/change_language_bottom_sheet.dart';

class MoreContent extends StatelessWidget {
  const MoreContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContentItem(
            icon: AppImages.shareAppIcon,
            title: LocaleKeys.more_shareApp.tr(),
          ),
          GestureDetector(
            onTap: () {
              openBottomSheet(
                context: context,
                bottomSheetContent: ChangeLanguageBottomSheet(),
              );
            },
            child: ProfileContentItem(
              icon: AppImages.languageIcon,
              title: LocaleKeys.more_language.tr(),
              leading: language(context),
            ),
          ),
          ProfileContentItem(
            icon: AppImages.contactUsIcon,
            title: LocaleKeys.more_contactus.tr(),
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoutes.aboutUsScreen);
            },
            child: ProfileContentItem(
              icon: AppImages.aboutUsIcon,
              title: LocaleKeys.more_aboutUS.tr(),
            ),
          ),
          ProfileContentItem(
            icon: AppImages.requestSpecialityIcon,
            title: LocaleKeys.more_requestSpeciality.tr(),
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoutes.privacyPolicyScreen);
            },
            child: ProfileContentItem(
              icon: AppImages.privacyPolicyIcon,
              title: LocaleKeys.more_privacyPolicy.tr(),
              isDivider: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget language(context) {
    bool isArabic = LocalizationService.isArabic(context);
    bool isEnglish = LocalizationService.isEnglish(context);
    return Container(
      width: 50.w,
      height: 26.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30).r,
        color: AppColors.antiFlashWhite,
      ),
      child: Center(
        child: Text(
          isArabic
              ? LocaleKeys.on_boarding_arabicLanguage.tr()
              : isEnglish
              ? LocaleKeys.on_boarding_englishLanguage.tr()
              : LocaleKeys.on_boarding_urduLanguage.tr(),
          style: AppTextStyles.font12DarkBlueRegular.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ),
    );
  }
}

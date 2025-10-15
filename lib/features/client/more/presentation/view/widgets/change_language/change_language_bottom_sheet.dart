import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helper/app_images.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/spacing.dart';
import '../../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  State<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  String? selectedCode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safe to use context here
    selectedCode ??= context.locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    final currentCode = selectedCode ?? context.locale.languageCode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.more_selectLanguageTitle.tr(),
                style: AppTextStyles.font20YellowMedium.copyWith(
                  color: AppColors.jet,
                ),
              ),
              verticalSpace(8),
              Text(
                LocaleKeys.more_chooseLanguageApp.tr(),
                style: AppTextStyles.font14OuterSpaceMedium.copyWith(
                  color: AppColors.davyGrey,
                ),
              ),
              verticalSpace(30),

              /// Arabic
              languageItem(
                code: 'ar',
                logo: AppImages.arabicLogo,
                language: LocaleKeys.on_boarding_arabicLanguage.tr(),
                isSelected: currentCode == 'ar',
              ),
              verticalSpace(16),

              /// English
              languageItem(
                code: 'en',
                logo: AppImages.englishLogo,
                language: LocaleKeys.on_boarding_englishLanguage.tr(),
                isSelected: currentCode == 'en',
              ),
              verticalSpace(16),

              /// Urdu
              languageItem(
                code: 'ur',
                logo: AppImages.urduLogo,
                language: LocaleKeys.on_boarding_urduLanguage.tr(),
                isSelected: currentCode == 'ur',
              ),
            ],
          ),
        ),
        verticalSpace(17),
        CustomBottomButton(
          textButton: LocaleKeys.save.tr(),
          onPressed: () async {
            if (selectedCode != null &&
                selectedCode != context.locale.languageCode) {
              // Set the new locale
              await context.setLocale(Locale(selectedCode!));

              // Pop the bottom sheet
              if (context.mounted && Navigator.canPop(context)) {
                Navigator.pop(context);
              }

              // Force rebuild of the entire app by navigating back to main home
              // This ensures all screens reflect the new language
              // if (mounted) {
              //   Navigator.pushNamedAndRemoveUntil(
              //     context,
              //     AppRoutes.mainHomeScreen,
              //     (route) => false,
              //   );
              // }
            } else {
              // If no change, just close the bottom sheet
              if (mounted && Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            }
          },
        ),
      ],
    );
  }

  Widget languageItem({
    required String code,
    required String logo,
    required String language,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => setState(() => selectedCode = code),
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
              color: AppColors.jet,
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
                color: isSelected ? AppColors.darkBlue : AppColors.lightGray,
                width: 1.5,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 14.w,
                      height: 14.h,
                      decoration: const BoxDecoration(
                        color: AppColors.darkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

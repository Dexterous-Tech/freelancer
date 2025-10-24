import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/services/localization_service.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../helper/functions.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'dart:ui' as ui show TextDirection;

class CustomCountryCodePicker extends StatefulWidget {
  final ValueNotifier<String> code; // Controller-like notifier
  final String?
  initialCountryCode; // Optional initial country code (e.g., '+966')

  const CustomCountryCodePicker({
    super.key,
    required this.code,
    this.initialCountryCode,
  });

  @override
  State<CustomCountryCodePicker> createState() =>
      _CustomCountryCodePickerState();
}

class _CustomCountryCodePickerState extends State<CustomCountryCodePicker> {
  bool isFocused = false; // 👈 focus tracking

  @override
  void initState() {
    super.initState();
    widget.code.value = widget.initialCountryCode ?? '+966';
  }

  @override
  Widget build(BuildContext context) {
    // Check if current language is Arabic or Urdu (RTL languages)
    final isRTL =
        LocalizationService.isArabic(context) ||
        LocalizationService.isUrdu(context);

    return Focus(
      onFocusChange: (focus) {
        setState(() => isFocused = focus);
      },
      child: GestureDetector(
        onTap: () {
          setState(() => isFocused = true);
        },
        child: Container(
          padding: EdgeInsetsGeometry.symmetric(vertical: 8.h, horizontal: 8.w),
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8).r,
              side: BorderSide(
                width: 1,
                color: isFocused
                    ? AppColors
                          .darkBlue //
                    : AppColors
                          .philippineSilver, // 🔸 Unfocused color (light gray)
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Directionality(
                  // For RTL languages, use RTL direction to flip flag and code positions
                  textDirection: isRTL
                      ? ui.TextDirection.rtl
                      : ui.TextDirection.ltr,

                  child: CountryCodePicker(
                    flagDecoration: BoxDecoration(shape: BoxShape.circle),
                    searchDecoration: InputDecoration(
                      hintText: LocaleKeys.authentication_selectCountry.tr(),
                    ),
                    headerText: LocaleKeys.authentication_selectCountry.tr(),
                    padding: EdgeInsets.zero,

                    onChanged: (code) {
                      final dialCode = code.dialCode ?? '';
                      if (dialCode.isNotEmpty) {
                        // Clean the dial code and ensure it starts with +
                        String cleanedCode = dialCode
                            .replaceAll('+', '')
                            .trim();
                        widget.code.value = '+$cleanedCode';
                      }
                    },
                    initialSelection: getCountryCodeFromDialCode(
                      widget.initialCountryCode,
                    ),
                    favorite: ['+966', 'SA'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    // Force the country code text to be LTR to prevent "+966" from displaying as "966+"
                    builder: (country) {
                      if (country == null) return const SizedBox.shrink();

                      return Directionality(
                        textDirection:
                            ui.TextDirection.ltr, // keep code left-to-right
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Flag image
                            if (!isRTL) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: Image.asset(
                                  country.flagUri!,
                                  package: 'country_code_picker',
                                  width: 24.w,
                                  height: 24.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 8.w),
                            ],

                            // Dial code text
                            Text(
                              country.dialCode ?? '+966',
                              style: AppTextStyles.font16DarkBlueRegular,
                            ),

                            if (isRTL) ...[
                              SizedBox(width: 8.w),

                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: Image.asset(
                                  country.flagUri!,
                                  package: 'country_code_picker',
                                  width: 24.w,
                                  height: 24.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    AppImages.dropDownArrowIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

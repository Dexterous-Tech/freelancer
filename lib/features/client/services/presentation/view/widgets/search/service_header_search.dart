import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/widgets/forms/custom_text_form_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ServiceHeaderSearch extends StatelessWidget {
  const ServiceHeaderSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomTextFormField(
        contentPadding: EdgeInsets.symmetric(vertical: 13.h),
        radius: 32.r,
        borderColor: AppColors.cultured,
        hintText: LocaleKeys.services_searchService.tr(),
        validator: (value) {
          return null;
        },
        controller: TextEditingController(),
        prefixIcon: SvgPicture.asset(
          AppImages.searchIcon,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

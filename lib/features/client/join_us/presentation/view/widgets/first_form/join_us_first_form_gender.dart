import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class JoinUsFirstFormGender extends StatefulWidget {
  const JoinUsFirstFormGender({super.key, required this.genderController});

  final TextEditingController genderController;

  @override
  State<JoinUsFirstFormGender> createState() => _JoinUsFirstFormGenderState();
}

class _JoinUsFirstFormGenderState extends State<JoinUsFirstFormGender> {
  String? selectedGender; // Initially null (both inactive)

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.authentication_gender.tr(),
          style: AppTextStyles.font12OuterSpaceSemiBold.copyWith(
            color: AppColors.jet,
          ),
        ),
        verticalSpace(8),
        Row(
          children: [
            Expanded(
              child: genderItem(
                onTap: () {
                  setState(() {
                    selectedGender = "male";
                    widget.genderController.text = "male";
                  });
                },
                isActive: selectedGender == "male",
                gender: LocaleKeys.authentication_maleTitle.tr(),
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: genderItem(
                onTap: () {
                  setState(() {
                    selectedGender = "female";
                    widget.genderController.text = "female";
                  });
                },
                isActive: selectedGender == "female",
                gender: LocaleKeys.authentication_femaleTitle.tr(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget genderItem({
    required bool isActive,
    required String gender,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: isActive ? AppColors.floralWhite : AppColors.cultured,
          border: Border.all(
            color: isActive ? AppColors.yellow : Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            gender,
            style: AppTextStyles.font18WhiteMedium.copyWith(
              color: isActive ? AppColors.darkBlue : AppColors.gray,
            ),
          ),
        ),
      ),
    );
  }
}

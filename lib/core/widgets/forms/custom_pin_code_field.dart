import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    super.key,
    this.controller,
    this.obscureText,
    required this.validator,
  });

  final TextEditingController? controller;
  final bool? obscureText;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      appContext: context,
      controller: controller,
      obscureText: false,
      keyboardType: TextInputType.text,
      validator: (value) {
        return validator(value);
      },
      textStyle: AppTextStyles.font16DarkBlueRegular,
      cursorColor: AppColors.black,
      cursorHeight: 15.h,
      enableActiveFill: true,
      autoDisposeControllers: false,
      pinTheme: PinTheme(
        activeColor: AppColors.darkBlue,
        disabledColor: AppColors.white,
        inactiveColor: AppColors.philippineSilver,
        selectedColor: AppColors.darkBlue,
        activeFillColor: AppColors.white,
        inactiveFillColor: AppColors.white,
        selectedFillColor: AppColors.white,
        errorBorderColor: AppColors.red,
        borderRadius: BorderRadius.circular(31.5).r,
        shape: PinCodeFieldShape.circle,
        fieldHeight: 63.h,
        fieldWidth: 63.w,
      ),
    );
  }
}

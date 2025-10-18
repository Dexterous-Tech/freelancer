import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:ui' as ui show TextDirection;

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    super.key,
    this.controller,
    this.obscureText,
    required this.validator,
    this.onChanged,
  });

  final TextEditingController? controller;
  final bool? obscureText;
  final Function(String?) validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        // Prevent drag start
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AbsorbPointer(
        absorbing: false, // Still allows typing
        child: Directionality(
          textDirection: ui.TextDirection.ltr,
          child: PinCodeTextField(
            length: 4,
            appContext: context,
            controller: controller,
            obscureText: false,
            keyboardType: TextInputType.text,
            // Custom validator
            validator: (value) => validator(value),
            onChanged: onChanged,
            // ✅ Disable text selection / copy / paste
            enabled: true,
            focusNode: FocusNode(
              onKeyEvent: (node, event) => KeyEventResult.ignored,
              skipTraversal: true,
              canRequestFocus: true,
            ),

            // Disable drag & drop (wrap in GestureDetector)
            pastedTextStyle: const TextStyle(color: Colors.transparent),

            beforeTextPaste: (text) {
              // Prevent paste completely
              return false;
            },
            textStyle: AppTextStyles.font16DarkBlueRegular,
            cursorColor: AppColors.black,
            cursorHeight: 15.h,
            enableActiveFill: true,
            autoDisposeControllers: false,
            // ✅ Disable paste & context menu
            enablePinAutofill: false, // disable autofill suggestion
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // ✅ Only numbers
            ],

            pinTheme: PinTheme(
              activeColor: AppColors.darkBlue,
              disabledColor: AppColors.white,
              inactiveColor: AppColors.philippineSilver,
              selectedColor: AppColors.darkBlue,
              activeFillColor: AppColors.white,
              inactiveFillColor: AppColors.white,
              selectedFillColor: AppColors.white,
              errorBorderColor: AppColors.red,
              borderRadius: BorderRadius.circular(8),
              shape: PinCodeFieldShape.box,
              fieldWidth: 80.h,
              fieldHeight: 60.w,
            ),
          ),
        ),
      ),
    );
  }
}

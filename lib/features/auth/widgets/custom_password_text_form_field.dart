import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helper/app_images.dart';
import '../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../generated/locale_keys.g.dart';

class CustomPasswordTextFormField extends StatelessWidget {
  const CustomPasswordTextFormField({
    super.key,
    required this.passwordController,
    required this.obscureText,
    required this.hint,
    required this.onToggleVisibility,
    this.compareWith, // 👈 if provided => confirmation mode
  });

  final TextEditingController passwordController;
  final bool obscureText;
  final String hint;
  final VoidCallback onToggleVisibility;
  final TextEditingController? compareWith;

  // ✅ Password validation pattern
  static final _passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>_\-]).{8,}$',
  );

  @override
  Widget build(BuildContext context) {
    final isConfirmation = compareWith != null;

    return CustomTextFormField(
      controller: passwordController,
      hintText: hint,
      obscureText: obscureText,
      enableInteractiveSelection: false,
      contextMenuBuilder: (context, editableTextState) => const SizedBox(),
      inputFormatters: [
        // ✅ Allow only English letters, digits, and common symbols
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<>_\-]'),
        ),
        LengthLimitingTextInputFormatter(20),
      ],
      suffixIcon: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onToggleVisibility,
        child: SvgPicture.asset(
          obscureText ? AppImages.visibleEyeIcon : AppImages.invisibleEyeIcon,
          width: 22.w,
          height: 22.h,
          fit: BoxFit.scaleDown,
        ),
      ),

      // ✅ Different validation rules depending on confirmation mode
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.authentication_fieldRequired.tr();
        }

        if (isConfirmation) {
          // Only check match if this is confirmation password
          if (value != compareWith!.text) {
            return LocaleKeys.authentication_passwordMismatch.tr();
          }
          return null;
        }

        // Normal password rules
        if (value.length < 8) {
          return LocaleKeys.authentication_passwordMinValidation.tr();
        }
        if (value.length > 20) {
          return LocaleKeys.authentication_passwordMaxValidation.tr();
        }
        if (!_passwordRegex.hasMatch(value)) {
          return LocaleKeys.authentication_passwordCriteriaValidation.tr();
        }

        return null;
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
  });

  final TextEditingController passwordController;
  final bool obscureText;
  final String hint;
  final VoidCallback onToggleVisibility;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: CustomTextFormField(
        controller: passwordController,
        hintText: hint,
        obscureText: obscureText,
        enableInteractiveSelection: false,
        contextMenuBuilder: (context, editableTextState) => const SizedBox(),
        suffixIcon: GestureDetector(
          onTap: onToggleVisibility,
          child: SvgPicture.asset(
            obscureText ? AppImages.visibleEyeIcon : AppImages.invisibleEyeIcon,
            width: 22.w,
            height: 22.h,
            fit: BoxFit.scaleDown,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return LocaleKeys.authentication_fieldRequired.tr();
          }
          if (value.length < 8) {
            return LocaleKeys.authentication_passwordMinValidation.tr();
          }
          if (value.length > 20) {
            return LocaleKeys.authentication_passwordMaxValidation.tr();
          }
          return null;
        },
      ),
    );
  }
}

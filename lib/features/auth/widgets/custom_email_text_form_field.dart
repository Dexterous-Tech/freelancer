import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer/core/widgets/forms/custom_text_form_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class CustomEmailTextFormField extends StatelessWidget {
  const CustomEmailTextFormField({
    super.key,
    required this.emailController,
    this.labelText,
  });
  final TextEditingController emailController;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      hintText: LocaleKeys.authentication_email.tr(),
      labelText: labelText,
      inputFormatters: [
        // Allow only valid email characters
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-+]')),
        // Limit to 100 characters
        LengthLimitingTextInputFormatter(100),
      ],
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return LocaleKeys.authentication_fieldRequired.tr();
        }

        // Basic email pattern validation
        const emailPattern =
            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        final regex = RegExp(emailPattern);

        if (!regex.hasMatch(value.trim())) {
          return LocaleKeys.authentication_invalidEmail.tr();
        }

        return null; // valid
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer/core/widgets/forms/custom_text_form_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class CustomNameTextFormField extends StatelessWidget {
  const CustomNameTextFormField({
    super.key,
    required this.hint,
    required this.nameController,
  });

  final String hint;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      hintText: hint,
      inputFormatters: [
        // ✅ allow only printable characters (letters, digits, symbols, spaces)
        FilteringTextInputFormatter.allow(RegExp(r'[ -~]')),
        // ✅ limit to 100 characters max
        LengthLimitingTextInputFormatter(100),
      ],
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return LocaleKeys.authentication_fieldRequired.tr();
        }
        if (value.trim().length < 2) {
          return LocaleKeys.authentication_nameValidation.tr();
        }
        return null;
      },
    );
  }
}

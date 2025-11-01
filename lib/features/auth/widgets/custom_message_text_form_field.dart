import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../generated/locale_keys.g.dart';

class CustomMessageTextFormField extends StatelessWidget {
  const CustomMessageTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.labelText,
  });

  final String hint;
  final String? labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hint,
      labelText: labelText,
      controller: controller,
      maxLines: 3,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(
            r"[a-zA-Z0-9\u0600-\u06FF!@#$%^&*(),.?:{}|<>_\-+=\[\]\\;'/\s]",
          ),
        ),
      ],
      validator: (value) {
        final text = value?.trim() ?? '';

        if (text.isEmpty) {
          return LocaleKeys.authentication_fieldRequired.tr();
        }
        if (text.length < 4) {
          return LocaleKeys.authentication_nameValidation.tr();
        }
        if (text.length > 500) {
          return LocaleKeys.authentication_nameMaxValidation.tr();
        }
        return null;
      },
    );
  }
}

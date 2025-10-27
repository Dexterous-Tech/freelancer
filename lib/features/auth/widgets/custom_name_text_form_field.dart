import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelancer/core/widgets/forms/custom_text_form_field.dart';

class CustomNameTextFormField extends StatelessWidget {
  const CustomNameTextFormField({
    super.key,
    required this.hint,
    required this.nameController,
    this.labelText,
    required this.validator,
  });

  final String hint;
  final TextEditingController nameController;
  final String? labelText;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      keyboardType: TextInputType.name,
      hintText: hint,
      labelText: labelText,
      errorStyle: TextStyle(height: 0),
      errorText: null,
      inputFormatters: [
        // ✅ Allow only English letters and spaces
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Zء-ي\s]'),
        ), // ✅ Limit length
        LengthLimitingTextInputFormatter(50),
      ],
      validator: validator,
    );
  }
}

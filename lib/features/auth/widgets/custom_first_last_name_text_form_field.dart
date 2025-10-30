import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/spacing.dart';
import '../../../generated/locale_keys.g.dart';
import 'custom_name_text_form_field.dart';

class CustomFirstLastNameTextFormField extends StatefulWidget {
  const CustomFirstLastNameTextFormField({
    super.key,
    required this.firstNameController,
    required this.secondNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController secondNameController;
  @override
  State<CustomFirstLastNameTextFormField> createState() =>
      _CustomFirstLastNameTextFormFieldState();
}

class _CustomFirstLastNameTextFormFieldState
    extends State<CustomFirstLastNameTextFormField> {
  String? errorFirstMessage;
  String? errorSecondMessage;

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.authentication_fieldRequired.tr();
    }
    if (value.trim().length < 2) {
      return LocaleKeys.authentication_nameValidation.tr();
    }
    if (value.trim().length > 50) {
      return LocaleKeys.authentication_nameMaxValidation.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomNameTextFormField(
                hint: LocaleKeys.authentication_firstNameHint.tr(),
                nameController: widget.firstNameController,
                validator: (value) {
                  final result = _validateName(value);
                  setState(() => errorFirstMessage = result);
                  return null;
                },
                borderColor: errorFirstMessage != null ? AppColors.red : null,
              ),
            ),
            horizontalSpace(8),
            Expanded(
              child: CustomNameTextFormField(
                hint: LocaleKeys.authentication_lastNameHint.tr(),
                nameController: widget.secondNameController,
                validator: (value) {
                  final result = _validateName(value);
                  setState(() => errorSecondMessage = result);
                  return null;
                },
                borderColor: errorSecondMessage != null ? AppColors.red : null,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: !errorFirstMessage.isNullOrEmpty()
                  ? _buildErrorText(errorFirstMessage)
                  : SizedBox.shrink(),
            ),
            horizontalSpace(8),
            Expanded(
              child: !errorSecondMessage.isNullOrEmpty()
                  ? _buildErrorText(errorSecondMessage)
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildErrorText(String? error) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: error != null
          ? Text(
              error,
              key: ValueKey(error),
              style: TextStyle(fontSize: 12.sp, color: Colors.red),
            )
          : const SizedBox.shrink(), // keeps height consistent
    );
  }
}

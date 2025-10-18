import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/spacing.dart';
import '../../../core/widgets/forms/custom_country_code_picker.dart';
import '../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../generated/locale_keys.g.dart';

class CustomPhoneTextFormField extends StatefulWidget {
  const CustomPhoneTextFormField({
    super.key,
    required this.countryCodeController,
    required this.phoneNumberController,
    this.labelText,
  });

  final TextEditingController countryCodeController;
  final TextEditingController phoneNumberController;
  final String? labelText;

  @override
  State<CustomPhoneTextFormField> createState() =>
      _CustomPhoneTextFormFieldState();
}

class _CustomPhoneTextFormFieldState extends State<CustomPhoneTextFormField> {
  String? phoneErrorMessage;
  final ValueNotifier<String> countryCode = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    countryCode.addListener(_syncCountryCode);
  }

  void _syncCountryCode() {
    if (!mounted) return;
    widget.countryCodeController.text = countryCode.value;
  }

  @override
  void dispose() {
    countryCode.removeListener(_syncCountryCode);
    countryCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Country code picker with same height as text field
        SizedBox(
          height: 60
              .h, // Match the height of CustomTextFormField (19.h * 2 + text height)
          child: CustomCountryCodePicker(code: countryCode),
        ),
        horizontalSpace(8),
        Expanded(
          child: CustomTextFormField(
            controller: widget.phoneNumberController,
            keyboardType: TextInputType.phone,
            hintText: LocaleKeys.authentication_phoneNumber.tr(),
            labelText: widget.labelText,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            errorText: phoneErrorMessage, // Show error within the text field
            validator: (value) {
              if (value == null || value.isEmpty) {
                final msg = LocaleKeys.authentication_fieldRequired.tr();
                setState(() => phoneErrorMessage = msg);
                return ''; // ❗ return non-null to block form submit
              }
              if (value.length < 9) {
                final msg = LocaleKeys.authentication_phoneValidation.tr();
                setState(() => phoneErrorMessage = msg);
                return ''; // ❗ also block submit
              }

              setState(() => phoneErrorMessage = null);
              return null; // ✅ valid
            },
          ),
        ),
      ],
    );
  }
}

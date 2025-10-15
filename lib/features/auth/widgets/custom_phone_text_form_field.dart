import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
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
  ValueNotifier<String> countryCode = ValueNotifier<String>('');
  @override
  void initState() {
    super.initState();
    countryCode.addListener(() {
      widget.countryCodeController.text = countryCode.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCountryCodePicker(code: countryCode),
              horizontalSpace(8),
              Expanded(
                child: CustomTextFormField(
                  controller: widget.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  hintText: LocaleKeys.authentication_phoneNumber.tr(),
                  labelText: widget.labelText,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // ✅ Only numbers
                  ],
                  errorText: null, // removes default error
                  errorStyle: const TextStyle(height: 0),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        phoneErrorMessage = LocaleKeys
                            .authentication_fieldRequired
                            .tr();
                      });
                      return null;
                    }
                    if (value.length < 9) {
                      setState(() {
                        phoneErrorMessage = LocaleKeys
                            .authentication_phoneValidation
                            .tr();
                      });
                      return null;
                    }
                    // ✅ No error
                    setState(() {
                      phoneErrorMessage = null;
                    });
                    return null;
                  }, // Empty validator to prevent height changes
                ),
              ),
            ],
          ),
        ),
        // Show error message below the row
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: phoneErrorMessage != null
              ? Padding(
                  key: const ValueKey('errorText'),
                  padding: EdgeInsets.only(top: 6.h, right: 4.w),
                  child: Text(
                    phoneErrorMessage!,
                    style: TextStyle(color: AppColors.red, fontSize: 12.sp),
                  ),
                )
              : const SizedBox(key: ValueKey('noError')),
        ),
      ],
    );
  }
}

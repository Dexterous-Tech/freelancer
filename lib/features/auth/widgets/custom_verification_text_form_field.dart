import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/forms/custom_pin_code_field.dart';
import '../../../generated/locale_keys.g.dart';

class CustomVerificationTextFormField extends StatelessWidget {
  const CustomVerificationTextFormField({
    super.key,
    required this.codeController,
    required this.onChange,
  });

  final TextEditingController codeController;
  final void Function() onChange;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: CustomPinCodeField(
        controller: codeController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.authentication_fieldRequired.tr();
          }
          return null;
        },
        onChanged: (value) {
          if (value.length == 4) {
            FocusScope.of(context).unfocus(); // hide keyboard
            // ✅ Navigate automatically
            Future.delayed(const Duration(milliseconds: 200), () {
              onChange();
            });
          }
        },
      ),
    );
  }
}

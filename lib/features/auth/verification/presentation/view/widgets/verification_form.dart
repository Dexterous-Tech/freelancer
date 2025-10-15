import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_pin_code_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../manager/verification_cubit.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = VerificationCubit.get(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Listener(
            onPointerDown: (_) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: CustomPinCodeField(
              controller: cubit.codeController,
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
                    if (context.mounted) {
                      // context.pushNamed(AppRoutes.newPasswordScreen);
                    }
                  });
                }
              },
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}

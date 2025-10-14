import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_pin_code_field.dart';
import 'package:freelancer/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ForgetPasswordCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Listener(
            onPointerDown: (_) {
              // Disable drag start
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: CustomPinCodeField(
              controller: cubit.codeController,
              validator: (value) {
                if (value.isNullOrEmpty()) {
                  return LocaleKeys.authentication_fieldRequired.tr();
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

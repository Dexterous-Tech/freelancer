import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:freelancer/features/auth/widgets/custom_phone_text_form_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/theme/spacing.dart';
import '../../../../widgets/custom_password_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: cubit.phoneFormKey,
            child: CustomPhoneTextFormField(
              countryCodeController: cubit.countryCodeController,
              phoneNumberController: cubit.phoneNumberController,
            ),
          ),
          verticalSpace(8),
          CustomPasswordTextFormField(
            passwordController: cubit.passwordController,
            obscureText: obscureText,
            hint: LocaleKeys.authentication_password.tr(),
            onToggleVisibility: () {
              setState(() => obscureText = !obscureText);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/auth/signup/presentation/manager/signup_cubit.dart';
import 'package:freelancer/features/auth/widgets/custom_name_text_form_field.dart';
import 'package:freelancer/features/auth/widgets/custom_phone_text_form_field.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../widgets/custom_password_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;
  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomNameTextFormField(
                  hint: LocaleKeys.authentication_firstNameHint.tr(),
                  nameController: cubit.firstNameController,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: CustomNameTextFormField(
                  hint: LocaleKeys.authentication_lastNameHint.tr(),
                  nameController: cubit.secondNameController,
                ),
              ),
            ],
          ),

          verticalSpace(8),
          CustomPhoneTextFormField(
            countryCodeController: cubit.countryCodeController,
            phoneNumberController: cubit.phoneController,
          ),
          verticalSpace(8),
          CustomPasswordTextFormField(
            passwordController: cubit.passwordController,
            obscureText: passwordObscureText,
            hint: LocaleKeys.authentication_password.tr(),
            onToggleVisibility: () {
              setState(() => passwordObscureText = !passwordObscureText);
            },
          ),
          verticalSpace(8),
          CustomPasswordTextFormField(
            passwordController: cubit.confirmPasswordController,
            compareWith: cubit.passwordController,
            obscureText: confirmPasswordObscureText,
            hint: LocaleKeys.authentication_passwordAgain.tr(),
            onToggleVisibility: () {
              setState(
                () => confirmPasswordObscureText = !confirmPasswordObscureText,
              );
            },
          ),
        ],
      ),
    );
  }
}

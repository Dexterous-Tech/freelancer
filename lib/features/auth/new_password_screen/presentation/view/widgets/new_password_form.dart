import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../widgets/custom_password_text_form_field.dart';
import '../../manager/new_password_cubit.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final cubit = NewPasswordCubit.get(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPasswordTextFormField(
            passwordController: cubit.newPasswordController,
            obscureText: obscureTextPassword,
            hint: LocaleKeys.authentication_newPasswordHint.tr(),
            onToggleVisibility: () {
              setState(() => obscureTextPassword = !obscureTextPassword);
            },
          ),
          verticalSpace(8),
          CustomPasswordTextFormField(
            passwordController: cubit.confirmNewPasswordController,
            compareWith: cubit.newPasswordController,
            obscureText: obscureTextConfirmPassword,
            hint: LocaleKeys.authentication_confirmNewPasswordHint.tr(),
            onToggleVisibility: () {
              setState(
                () => obscureTextConfirmPassword = !obscureTextConfirmPassword,
              );
            },
          ),
        ],
      ),
    );
  }
}

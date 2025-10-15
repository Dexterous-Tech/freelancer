import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../manager/client_change_password_cubit.dart';

import '../../../../../../core/theme/spacing.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../auth/widgets/custom_password_text_form_field.dart';

class ClientChangePasswordForm extends StatefulWidget {
  const ClientChangePasswordForm({super.key});

  @override
  State<ClientChangePasswordForm> createState() =>
      _ClientChangePasswordFormState();
}

class _ClientChangePasswordFormState extends State<ClientChangePasswordForm> {
  bool currentPassword = true;
  bool newPassword = true;
  bool confirmPassword = true;
  @override
  Widget build(BuildContext context) {
    final cubit = ClientChangePasswordCubit.get(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            key: cubit.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPasswordTextFormField(
                    passwordController: cubit.currentPasswordController,
                    obscureText: currentPassword,
                    hint: LocaleKeys.authentication_currentPassword.tr(),
                    onToggleVisibility: () {
                      setState(() => currentPassword = !currentPassword);
                    },
                  ),
                  verticalSpace(8),
                  CustomPasswordTextFormField(
                    passwordController: cubit.newPasswordController,
                    obscureText: newPassword,
                    hint: LocaleKeys.authentication_newPasswordHint.tr(),
                    onToggleVisibility: () {
                      setState(() => newPassword = !newPassword);
                    },
                  ),
                  verticalSpace(8),
                  CustomPasswordTextFormField(
                    passwordController: cubit.confirmPasswordController,
                    compareWith: cubit.newPasswordController,
                    obscureText: confirmPassword,
                    hint: LocaleKeys.authentication_confirmNewPasswordHint.tr(),
                    onToggleVisibility: () {
                      setState(() => confirmPassword = !confirmPassword);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

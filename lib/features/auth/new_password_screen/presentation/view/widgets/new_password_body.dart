import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';
import 'package:freelancer/features/auth/new_password_screen/presentation/manager/new_password_cubit.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import 'new_password_form.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AuthBody(
        title: LocaleKeys.authentication_newPasswordTitle.tr(),
        subTitle: LocaleKeys.authentication_enterNewPassword.tr(),
        authBodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewPasswordForm(),
            verticalSpace(16),
            CustomElevatedButton(
              onPressed: () {
                final cubit = NewPasswordCubit.get(context);
                if (cubit.formKey.currentState!.validate()) {}
              },
              textButton: LocaleKeys.save.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

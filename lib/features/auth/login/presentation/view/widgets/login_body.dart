import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';
import 'package:freelancer/features/auth/login/presentation/manager/login_cubit.dart';
import 'login_form.dart';
import '../../../../widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AuthBody(
        isBack: false,
        title: LocaleKeys.authentication_loginTitle.tr(),
        subTitle: LocaleKeys.authentication_welcomeBack.tr(),
        authBodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginForm(),
            verticalSpace(8),
            GestureDetector(
              onTap: () {},
              child: Text(
                LocaleKeys.authentication_forgetPasswordQu.tr(),
                style: AppTextStyles.font14BlackRegular.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
            ),
            verticalSpace(16),
            CustomElevatedButton(
              onPressed: () {
                final cubit = LoginCubit.get(context);
                if (cubit.formKey.currentState!.validate()) {
                  log(
                    "${cubit.phoneNumberController.text} , ${cubit.passwordController.text} , ${cubit.countryCodeController.text}",
                  );
                }
              },
              textButton: LocaleKeys.authentication_loginButton.tr(),
            ),
            verticalSpace(16),
            Center(
              child: Text(
                LocaleKeys.authentication_notHaveAccount.tr(),
                style: AppTextStyles.font16DarkBlueRegular.copyWith(
                  color: AppColors.outerSpace,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Text(
                  LocaleKeys.authentication_createNewAccount.tr(),
                  style: AppTextStyles.font16DarkBlueRegular,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

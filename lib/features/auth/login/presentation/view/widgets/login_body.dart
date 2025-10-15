import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/app_text_styles.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/forms/custom_elevated_button.dart';
import 'package:freelancer/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:freelancer/features/auth/widgets/auth_question.dart';
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
              onTap: () {
                final cubit = LoginCubit.get(context);
                if (cubit.phoneFormKey.currentState!.validate() &&
                    !cubit.phoneNumberController.text.isNullOrEmpty()) {
                  // Ensure country code format is +XXX (not XXX+)
                  String countryCode = cubit.countryCodeController.text.trim();
                  // Remove any + signs and add one at the start
                  countryCode = '+${countryCode.replaceAll('+', '')}';

                  context.pushNamed(
                    AppRoutes.forgetScreen,
                    arguments:
                        '$countryCode ${cubit.phoneNumberController.text}',
                  );
                }
              },
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
            AuthQuestion(
              title: LocaleKeys.authentication_notHaveAccount.tr(),
              subtitle: LocaleKeys.authentication_createNewAccount.tr(),
              onTap: () {
                context.pushNamed(AppRoutes.signupScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/auth/signup/presentation/manager/signup_cubit.dart';
import 'package:freelancer/features/auth/signup/presentation/view/widgets/signup_form.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/widgets/forms/custom_elevated_button.dart';
import '../../../../widgets/auth_question.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AuthBody(
        title: LocaleKeys.authentication_createNewAccountTitle.tr(),
        subTitle: LocaleKeys.authentication_takeTwoSteps.tr(),
        authBodyContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignupForm(),
            verticalSpace(16),
            CustomElevatedButton(
              onPressed: () {
                final cubit = SignupCubit.get(context);
                if (cubit.formKey.currentState!.validate()) {
                  // Ensure country code format is +XXX (not XXX+)
                  String countryCode = cubit.countryCodeController.text.trim();
                  // Remove any + signs and add one at the start
                  countryCode = '+${countryCode.replaceAll('+', '')}';

                  context.pushNamed(
                    AppRoutes.verificationScreen,
                    arguments: '$countryCode ${cubit.phoneController.text}',
                  );
                }
              },
              textButton: LocaleKeys.authentication_createNewAccount.tr(),
            ),
            verticalSpace(16),
            AuthQuestion(
              title: LocaleKeys.authentication_alreadyHaveAccount.tr(),
              subtitle: LocaleKeys.authentication_loginTitle.tr(),
              onTap: () {
                context.pushReplacementNamed(AppRoutes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

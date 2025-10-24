import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/signup/presentation/manager/signup_cubit.dart';
import 'package:freelancer/features/auth/signup/presentation/view/widgets/signup_button.dart';
import 'package:freelancer/features/auth/signup/presentation/view/widgets/signup_form.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../widgets/auth_question.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is SignupSuccess) {
          final cubit = SignupCubit.get(context);
          context.pushReplacementNamed(
            AppRoutes.verificationScreen,
            arguments: ForgetPasswordRequestBodyModel(
              countryCode: cubit.countryCodeController.text,
              phone: cubit.phoneController.text,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: AuthBody(
          title: LocaleKeys.authentication_createNewAccountTitle.tr(),
          subTitle: LocaleKeys.authentication_takeTwoSteps.tr(),
          authBodyContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignupForm(),
              verticalSpace(16),
              SignupButton(),
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
      ),
    );
  }
}

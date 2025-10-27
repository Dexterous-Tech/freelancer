import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/bottom_sheet/correct_bottom_sheet.dart';
import 'package:freelancer/core/widgets/bottom_sheet/error_bottom_sheet.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/new_password_screen/presentation/manager/new_password_cubit.dart';
import 'package:freelancer/features/auth/new_password_screen/presentation/view/widgets/new_password_button.dart';
import 'package:freelancer/features/auth/widgets/auth_body.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import 'new_password_form.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({
    super.key,
    required this.forgetPasswordRequestBodyModel,
  });

  final ForgetPasswordRequestBodyModel forgetPasswordRequestBodyModel;
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPasswordCubit, NewPasswordState>(
      listener: (context, state) {
        if (state is NewPasswordFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is NewPasswordSuccess) {
          openBottomSheet(
            context: context,
            bottomSheetContent: CorrectBottomSheet(
              message: state.authActionResponseModel.message,
              onPressed: () {
                context.pop();
                context.pushReplacementNamed(AppRoutes.loginScreen);
              },
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: AuthBody(
          title: LocaleKeys.authentication_newPasswordTitle.tr(),
          subTitle: LocaleKeys.authentication_enterNewPassword.tr(),
          authBodyContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewPasswordForm(),
              verticalSpace(16),
              NewPasswordButton(
                forgetPasswordRequestBodyModel: forgetPasswordRequestBodyModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

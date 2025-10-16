import 'package:flutter/material.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/auth/forget_password/presentation/manager/forget_password_cubit.dart';
import 'package:freelancer/features/auth/widgets/custom_verification_text_form_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ForgetPasswordCubit.get(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomVerificationTextFormField(
            codeController: cubit.codeController,
            route: AppRoutes.newPasswordScreen,
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}

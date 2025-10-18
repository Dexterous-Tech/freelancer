import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/bottom_sheet/error_bottom_sheet.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import '../../manager/forget_password_cubit.dart';
import 'package:freelancer/features/auth/widgets/custom_verification_text_form_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
    required this.forgetPasswordRequestBodyModel,
  });

  final ForgetPasswordRequestBodyModel forgetPasswordRequestBodyModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (context, state) =>
          state is VerifyForgetLoading ||
          state is VerifyForgetSuccess ||
          state is VerifyForgetFailure,
      listenWhen: (context, state) =>
          state is VerifyForgetLoading ||
          state is VerifyForgetSuccess ||
          state is VerifyForgetFailure,
      listener: (context, state) {
        if (state is VerifyForgetFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is VerifyForgetSuccess) {
          context.pushNamed(
            AppRoutes.newPasswordScreen,
            arguments: forgetPasswordRequestBodyModel,
          );
        }
      },
      builder: (context, state) {
        final cubit = ForgetPasswordCubit.get(context);
        final loading = state is VerifyForgetLoading;
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVerificationTextFormField(
                codeController: cubit.otpCodeController,
                onChange: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.verifyForget(
                      countryCode: forgetPasswordRequestBodyModel.countryCode,
                      phone: forgetPasswordRequestBodyModel.phone,
                    );
                  }
                },
              ),
              verticalSpace(16),
              if (loading) ...[
                const Center(
                  child: CircularProgressIndicator(color: AppColors.yellow),
                ),
                verticalSpace(16),
              ],
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/common/edit_profile/data/models/update_profile_model.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/bottom_sheet/correct_bottom_sheet.dart';
import '../../../../../../core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../../../../../core/widgets/bottom_sheet/open_bottom_sheet.dart';
import '../../../../login/data/models/forget_password_model.dart';
import '../../../../widgets/custom_verification_text_form_field.dart';
import '../../manager/verification_cubit.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({
    super.key,
    this.forgetPasswordRequestBodyModel,
    this.verificationUpdateProfile,
  });

  final ForgetPasswordRequestBodyModel? forgetPasswordRequestBodyModel;
  final VerificationUpdateProfile? verificationUpdateProfile;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      buildWhen: (context, state) =>
          state is VerificationLoading ||
          state is VerificationFailure ||
          state is VerificationSuccess,
      listenWhen: (context, state) =>
          state is VerificationLoading ||
          state is VerificationFailure ||
          state is VerificationSuccess,
      listener: (context, state) {
        if (state is VerificationFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is VerificationSuccess) {
          openBottomSheet(
            context: context,
            bottomSheetContent: CorrectBottomSheet(
              message: state.success.message,
              onPressed: verificationUpdateProfile?.needVerification == 1
                  ? () {
                      context.pop();
                      context.pop();
                      context.pop();
                      Navigator.pop(context, true);
                    }
                  : () {
                      context.pop();
                      context.pushReplacementNamed(AppRoutes.loginScreen);
                    },
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = VerificationCubit.get(context);
        final loading = state is VerificationLoading;
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVerificationTextFormField(
                codeController: cubit.codeController,
                onChange: () {
                  if (cubit.formKey.currentState!.validate()) {
                    verificationUpdateProfile?.needVerification == 1
                        ? cubit.verifyOtp(
                            countryCode:
                                verificationUpdateProfile?.oldCountryCode ?? '',
                            phone:
                                verificationUpdateProfile?.oldPhoneNumber ?? '',
                            newPassword: verificationUpdateProfile?.phoneNumber,
                            newCountryCode:
                                verificationUpdateProfile?.countryCode,
                            isUpdateProfile: true,
                          )
                        : cubit.verifyOtp(
                            countryCode:
                                forgetPasswordRequestBodyModel?.countryCode ??
                                '',
                            phone: forgetPasswordRequestBodyModel?.phone ?? '',
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

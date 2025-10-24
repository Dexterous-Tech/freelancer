import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/widgets/bottom_sheet/error_bottom_sheet.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';

import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../manager/login_cubit.dart';

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (context, state) =>
          state is ForgetPasswordLoading ||
          state is ForgetPasswordSuccess ||
          state is ForgetPasswordFailure,
      buildWhen: (cotext, state) =>
          state is ForgetPasswordLoading ||
          state is ForgetPasswordSuccess ||
          state is ForgetPasswordFailure,
      listener: (context, state) {
        if (state is ForgetPasswordFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(
              error: state.error.displayMessage,
            ),
          );
        }
        if (state is ForgetPasswordSuccess) {
          final cubit = LoginCubit.get(context);

          context.pushNamed(
            AppRoutes.forgetScreen,
            arguments: ForgetPasswordRequestBodyModel(
              countryCode: cubit.countryCodeController.text,
              phone: cubit.phoneNumberController.text,
            ),
          );
        }
      },
      builder: (context, state) {
        final loading = state is ForgetPasswordLoading;
        return GestureDetector(
          onTap: () {
            final cubit = LoginCubit.get(context);
            if (cubit.phoneFormKey.currentState!.validate() &&
                !cubit.phoneNumberController.text.isNullOrEmpty()) {
              // // Ensure country code format is +XXX (not XXX+)
              // String countryCode = cubit.countryCodeController.text
              //     .trim();
              // // Remove any + signs and add one at the start
              // countryCode = '+${countryCode.replaceAll('+', '')}';
              cubit.forgetPassword();
            }
          },
          child: loading
              ? CircularProgressIndicator(color: AppColors.darkBlue)
              : Text(
                  LocaleKeys.authentication_forgetPasswordQu.tr(),
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),
        );
      },
    );
  }
}

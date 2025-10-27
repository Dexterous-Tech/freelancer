import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/features/auth/login/presentation/manager/login_cubit.dart';
import '../../../../../../core/widgets/forms/custom_elevated_button.dart';
import '../../../../../../generated/locale_keys.g.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            onPressed: () {
              final cubit = LoginCubit.get(context);
              if (cubit.formKey.currentState!.validate() &&
                  cubit.phoneFormKey.currentState!.validate()) {
                cubit.login();
              }
            },
            textButton: LocaleKeys.authentication_loginButton.tr(),
            buttonWidget: isLoading
                ? CircularProgressIndicator(color: AppColors.yellow)
                : null,
          ),
        );
      },
    );
  }
}

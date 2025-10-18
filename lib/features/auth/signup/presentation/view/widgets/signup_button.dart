import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/theme/app_colors.dart';
import 'package:freelancer/features/auth/signup/presentation/manager/signup_cubit.dart';

import '../../../../../../core/widgets/forms/custom_elevated_button.dart';
import '../../../../../../generated/locale_keys.g.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        final cubit = SignupCubit.get(context);
        final loading = state is SignupLoading;
        return SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.register();
              }
            },
            textButton: LocaleKeys.authentication_createNewAccount.tr(),
            buttonWidget: loading
                ? const CircularProgressIndicator(color: AppColors.yellow)
                : null,
          ),
        );
      },
    );
  }
}

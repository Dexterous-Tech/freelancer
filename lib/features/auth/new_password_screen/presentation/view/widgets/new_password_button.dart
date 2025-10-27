import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/theme/app_colors.dart';

import '../../../../../../core/widgets/forms/custom_elevated_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../login/data/models/forget_password_model.dart';
import '../../manager/new_password_cubit.dart';

class NewPasswordButton extends StatelessWidget {
  const NewPasswordButton({
    super.key,
    required this.forgetPasswordRequestBodyModel,
  });

  final ForgetPasswordRequestBodyModel forgetPasswordRequestBodyModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPasswordCubit, NewPasswordState>(
      builder: (context, state) {
        final cubit = NewPasswordCubit.get(context);
        final loading = state is NewPasswordLoading;
        return SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.resetPassword(
                  countryCode: forgetPasswordRequestBodyModel.countryCode,
                  phone: forgetPasswordRequestBodyModel.phone,
                );
              }
            },
            textButton: LocaleKeys.save.tr(),
            buttonWidget: loading
                ? const CircularProgressIndicator(color: AppColors.yellow)
                : null,
          ),
        );
      },
    );
  }
}

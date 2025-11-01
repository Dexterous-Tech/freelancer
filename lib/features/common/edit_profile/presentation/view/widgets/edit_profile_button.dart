import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../manager/edit_profile_cubit.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (context, state) =>
          state is EditProfileLoading ||
          state is EditProfileSuccess ||
          state is EditProfileFailure,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: CustomBottomButton(
            textButton: LocaleKeys.save.tr(),
            onPressed: () {
              final cubit = EditProfileCubit.get(context);
              if (cubit.formKey.currentState!.validate()) {
                cubit.updateProfile();
              }
            },
            isLoading: state is EditProfileLoading,
          ),
        );
      },
    );
  }
}

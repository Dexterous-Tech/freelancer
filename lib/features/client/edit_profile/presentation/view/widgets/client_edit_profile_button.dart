import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../manager/client_edit_profile_cubit.dart';

class ClientEditProfileButton extends StatelessWidget {
  const ClientEditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientEditProfileCubit, ClientEditProfileState>(
      buildWhen: (context, state) =>
          state is ClientEditProfileLoading ||
          state is ClientEditProfileSuccess ||
          state is ClientEditProfileFailure,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: CustomBottomButton(
            textButton: LocaleKeys.save.tr(),
            onPressed: () {
              final cubit = ClientEditProfileCubit.get(context);
              if (cubit.formKey.currentState!.validate()) {
                cubit.updateProfile();
              }
            },
            isLoading: state is ClientEditProfileLoading,
          ),
        );
      },
    );
  }
}

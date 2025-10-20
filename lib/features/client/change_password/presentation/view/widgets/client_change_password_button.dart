import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../manager/client_change_password_cubit.dart';

class ClientChangePasswordButton extends StatelessWidget {
  const ClientChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientChangePasswordCubit, ClientChangePasswordState>(
      builder: (context, state) {
        final cubit = ClientChangePasswordCubit.get(context);
        return SizedBox(
          width: double.infinity,
          child: CustomBottomButton(
            isLoading: state is ClientChangePasswordLoading,
            textButton: LocaleKeys.save.tr(),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.changePassword();
              }
            },
          ),
        );
      },
    );
  }
}

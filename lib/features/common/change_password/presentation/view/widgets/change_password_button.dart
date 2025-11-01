import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_bottom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../manager/change_password_cubit.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        final cubit = ChangePasswordCubit.get(context);
        return SizedBox(
          width: double.infinity,
          child: CustomBottomButton(
            isLoading: state is ChangePasswordLoading,
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

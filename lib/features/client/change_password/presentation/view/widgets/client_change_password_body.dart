import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'success_bottom_sheet/success_bottom_sheet.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import '../../../../../../core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../manager/client_change_password_cubit.dart';
import 'client_change_password_button.dart';
import 'client_change_password_form.dart';

class ClientChangePasswordBody extends StatelessWidget {
  const ClientChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClientChangePasswordCubit, ClientChangePasswordState>(
      listenWhen: (context, state) =>
          state is ClientChangePasswordFailure ||
          state is ClientChangePasswordSuccess ||
          state is ClientChangePasswordLoading,
      listener: (context, state) {
        if (state is ClientChangePasswordFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is ClientChangePasswordSuccess) {
          openBottomSheet(
            context: context,
            bottomSheetContent: SuccessBottomSheet(
              onPressed: () {
                context.pop();
                context.pop();
                Navigator.pop(context, true);
              },
            ),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeader(title: LocaleKeys.profile_editPasswordTitle.tr()),
          verticalSpace(24),
          Expanded(child: ClientChangePasswordForm()),
          // Expanded(child: verticalSpace(16)),
          ClientChangePasswordButton(),
        ],
      ),
    );
  }
}

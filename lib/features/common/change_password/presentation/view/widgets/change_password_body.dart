import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import '../../../../../../core/widgets/bottom_sheet/success_bottom_sheet.dart';
import 'package:freelancer/generated/locale_keys.g.dart';
import '../../../../../../core/widgets/bottom_sheet/error_bottom_sheet.dart';
import '../../manager/change_password_cubit.dart';
import 'change_password_button.dart';
import 'change_password_form.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listenWhen: (context, state) =>
          state is ChangePasswordFailure ||
          state is ChangePasswordSuccess ||
          state is ChangePasswordLoading,
      listener: (context, state) {
        if (state is ChangePasswordFailure) {
          openBottomSheet(
            context: context,
            bottomSheetContent: ErrorBottomSheet(error: state.error),
          );
        }
        if (state is ChangePasswordSuccess) {
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
          Expanded(child: ChangePasswordForm()),
          // Expanded(child: verticalSpace(16)),
          ChangePasswordButton(),
        ],
      ),
    );
  }
}

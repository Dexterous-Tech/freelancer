import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/bottom_sheet/open_bottom_sheet.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/features/client/change_password/presentation/view/widgets/success_bottom_sheet/success_bottom_sheet.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

import 'client_change_password_form.dart';

class ClientChangePasswordBody extends StatelessWidget {
  const ClientChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.profile_editPasswordTitle.tr()),
        verticalSpace(24),
        Expanded(child: ClientChangePasswordForm()),
        Expanded(child: verticalSpace(50)),
        CustomBottomButton(
          textButton: LocaleKeys.save.tr(),
          onPressed: () {
            openBottomSheet(
              context: context,
              bottomSheetContent: SuccessBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}

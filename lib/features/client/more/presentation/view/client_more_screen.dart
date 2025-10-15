import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'widgets/client_more_content.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ClientMoreScreen extends StatelessWidget {
  const ClientMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(
          title: LocaleKeys.bottomNavigationBar_more.tr(),
          isBack: false,
        ),
        verticalSpace(24),
        ClientMoreContent(),
      ],
    );
  }
}

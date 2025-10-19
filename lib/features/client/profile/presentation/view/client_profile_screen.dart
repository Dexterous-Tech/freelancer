import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'widgets/profile_content.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHeader(
                title: LocaleKeys.bottomNavigationBar_profile.tr(),
                isBack: false,
              ),
              ProfileContent(),
            ],
          ),
        ),
      ],
    );
  }
}

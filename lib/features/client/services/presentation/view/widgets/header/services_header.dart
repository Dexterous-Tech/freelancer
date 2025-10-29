import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/features/client/services/presentation/view/widgets/search/service_header_search.dart';
import 'package:freelancer/features/client/services/presentation/view/widgets/category/services_categories_list.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ServicesHeader extends StatelessWidget {
  const ServicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      isBack: false,
      title: LocaleKeys.bottomNavigationBar_services.tr(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServiceHeaderSearch(),
          verticalSpace(16),
          ServicesCategoriesList(),
          verticalSpace(24),
        ],
      ),
    );
  }
}

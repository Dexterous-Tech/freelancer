import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'package:freelancer/features/client/services_favourite/presentation/view/widgets/services_favourite_categories_list.dart';

import '../../../../../../generated/locale_keys.g.dart';

class ServicesFavouriteHeader extends StatelessWidget {
  const ServicesFavouriteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      title: LocaleKeys.services_serviceFavourite.tr(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ServicesFavouriteCategoriesList(), verticalSpace(24)],
      ),
    );
  }
}

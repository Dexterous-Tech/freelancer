import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import '../../../../widgets/service_provider_item.dart';

class ServiceFavouriteProviderItemsList extends StatelessWidget {
  const ServiceFavouriteProviderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ServiceProviderItem(isSpecial: false, isRead: true, isFav: true);
      },
      separatorBuilder: (context, index) => verticalSpace(16),
      itemCount: 5,
    );
  }
}

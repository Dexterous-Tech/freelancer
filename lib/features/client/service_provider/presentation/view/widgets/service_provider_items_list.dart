import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'service_provider_item.dart';

class ServiceProviderItemsList extends StatelessWidget {
  const ServiceProviderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ServiceProviderItem(isSpecial: false, isRead: true);
      },
      separatorBuilder: (context, index) => verticalSpace(16),
      itemCount: 5,
    );
  }
}

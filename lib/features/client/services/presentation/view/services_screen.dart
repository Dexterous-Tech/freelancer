import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/features/client/services/presentation/view/widgets/header/services_header.dart';
import 'package:freelancer/features/client/services/presentation/view/widgets/sub_category/services_sub_category_grid.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ServicesHeader(),
        verticalSpace(24),
        Expanded(child: ServicesSubCategoryGrid()),
      ],
    );
  }
}

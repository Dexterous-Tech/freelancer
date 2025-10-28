import 'package:flutter/material.dart';
import 'widgets/header/services_header.dart';
import 'widgets/sub_category/services_sub_category_grid.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ServicesHeader(),
        Expanded(child: ServicesSubCategoryGrid()),
      ],
    );
  }
}

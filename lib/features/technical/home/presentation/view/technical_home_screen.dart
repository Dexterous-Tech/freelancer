import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'widgets/technical_home_statistics.dart';
import 'widgets/technical_home_data.dart';
import 'widgets/technical_home_header.dart';

class TechnicalHomeScreen extends StatelessWidget {
  const TechnicalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TechnicalHomeHeader(),
        verticalSpace(24),
        TechnicalHomeData(),
        verticalSpace(24),
        TechnicalHomeStatistics(),
      ],
    );
  }
}

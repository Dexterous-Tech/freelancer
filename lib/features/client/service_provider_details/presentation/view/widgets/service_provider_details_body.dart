import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelancer/core/theme/spacing.dart';
import 'package:freelancer/core/widgets/custom_bottom_button.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'service_provider_details_content.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ServiceProviderDetailsBody extends StatelessWidget {
  const ServiceProviderDetailsBody({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.services_serviceProviderDetails.tr()),
        verticalSpace(24),
        Expanded(
          child: SingleChildScrollView(child: ServiceProviderDetailsContent()),
        ),
        CustomBottomButton(
          onPressed: () {},
          textButton: LocaleKeys.services_contactTechnical.tr(),
        ),
      ],
    );
  }
}

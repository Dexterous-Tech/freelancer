import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/widgets/custom_header.dart';
import 'service_provider_items_list.dart';
import 'package:freelancer/generated/locale_keys.g.dart';

class ServiceProviderBody extends StatelessWidget {
  const ServiceProviderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeader(title: LocaleKeys.services_serviceProviders.tr()),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ServiceProviderItemsList(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'service_favourite_provider_items_list.dart';
import 'services_favourite_header.dart';

class ServicesFavouriteBody extends StatelessWidget {
  const ServicesFavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ServicesFavouriteHeader(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: ServiceFavouriteProviderItemsList(),
          ),
        ),
      ],
    );
  }
}

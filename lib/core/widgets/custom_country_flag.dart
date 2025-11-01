import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCountryFlag extends StatelessWidget {
  const CustomCountryFlag({super.key, required this.countryCode});

  final String countryCode;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CountryFlag.fromCountryCode(
        countryCode,
        height: 18.h,
        width: 18.w,
      ),
    );
  }
}

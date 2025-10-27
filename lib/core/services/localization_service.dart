import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  static bool isArabic(BuildContext context) =>
      context.locale.languageCode == 'ar';

  static bool isEnglish(BuildContext context) =>
      context.locale.languageCode == 'en';

  static bool isUrdu(BuildContext context) =>
      context.locale.languageCode == 'ur';
}

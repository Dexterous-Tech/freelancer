// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "on_boarding": {
    "welcome": "مرحبا بكم",
    "requestTechnician": "يمكنك طلب الفني بسهولة",
    "selectLanguage": "حدد اللغة",
    "arabicLanguage": "العربية",
    "englishLanguage": "الإنجليزية",
    "urduLanguage": "الأُردو",
    "nearbyTechnicians": "يمكنك مشاهدة الفنيين القريبين منك و اختيار ما يناسبك منهم بسهولة"
  },
  "authentication": {
    "login": "تسجيل الدخول",
    "welcomeBack": "مرحبا بعودتك"
  },
  "next": "التالي"
};
static const Map<String,dynamic> _en = {
  "on_boarding": {
    "welcome": "Welcome",
    "requestTechnician": "You can request a technician easily",
    "selectLanguage": "Select language",
    "arabicLanguage": "Arabic",
    "englishLanguage": "English",
    "urduLanguage": "Urdu",
    "nearbyTechnicians": "You can view nearby technicians and easily choose the one that suits you"
  },
  "authentication": {
    "login": "Login",
    "welcomeBack": "Welcome back"
  },
  "next": "Next"
};
static const Map<String,dynamic> _ur = {
  "on_boarding": {
    "welcome": "خوش آمدید",
    "requestTechnician": "آپ آسانی سے ٹیکنیشن کی درخواست کر سکتے ہیں",
    "selectLanguage": "زبان منتخب کریں",
    "arabicLanguage": "عربی",
    "englishLanguage": "انگریزی",
    "urduLanguage": "اردو",
    "nearbyTechnicians": "آپ اپنے قریب موجود ٹیکنیشنز کو دیکھ سکتے ہیں اور آسانی سے اپنے لیے موزوں ٹیکنیشن منتخب کر سکتے ہیں"
  },
  "authentication": {
    "login": "لاگ ان",
    "welcomeBack": "واپسی پر خوش آمدید"
  },
  "next": "اگلا"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en, "ur": _ur};
}

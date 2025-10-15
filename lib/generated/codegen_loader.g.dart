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
    "welcomeBack": "مرحبا بعودتك",
    "phoneNumber": "رقم الهاتف",
    "password": "كلمة المرور",
    "forgetPasswordQu": "نسيت كلمة المرور ؟",
    "loginButton": "سجل الدخول",
    "notHaveAccount": "ليس لديك حساب؟",
    "createNewAccount": "انشئ حساب جديد",
    "forgetPasswordTitle": "نسيت كلمة المرور",
    "loginTitle": "تسجيل الدخول",
    "enterDigits": "قم بإدخال الرمز المكون من 4 أرقام الذي تم إرساله على رقم هاتفك",
    "resendAgain": "إعادة الإرسال مرة أخرى",
    "newPasswordTitle": "كلمة السر الجديدة",
    "newPasswordHint": "كلمة المرور الجديدة",
    "confirmNewPasswordHint": "كلمة المرور الجديدة مجدداً",
    "createNewAccountTitle": "إنشاء حساب جديد",
    "takeTwoSteps": "الأمر يحتاج من خطوتين فقط !",
    "firstNameHint": "الاسم الأول",
    "lastNameHint": "الاسم الأخير",
    "alreadyHaveAccount": "لديك حساب بالفعل؟",
    "verifyAccountTitle": "توثيق حسابك",
    "fieldRequired": "هذا الحقل إلزامي",
    "passwordValidation": "يجب ألا تقل كلمة المرور عن 8 حروف",
    "selectCountry": "اختر الدولة",
    "enterNewPassword": "قم بإدخال كلمة المرور الجديدة مرتين ثم الذهاب لتسجيل الدخول",
    "passwordMinValidation": "يجب ألا تقل كلمة المرور عن 8 حروف",
    "passwordMaxValidation": "يجب ألا تزيد كلمة المرور عن 20 حرفًا",
    "nameValidation": "يجب ألا يقل اسم المستخدم عن حرفين",
    "phoneValidation": "يجب ألا يقل رقم الهاتف عن 9 أرقام",
    "passwordAgain": "كلمة المرور مرة أخرى",
    "passwordMismatch": "يجب أن تتطابق كلمتا المرور",
    "currentPassword": "كلمة المرور الحالية"
  },
  "next": "التالي",
  "save": "حفظ",
  "bottomNavigationBar": {
    "home": "الرئيسية",
    "profile": "حسابي",
    "services": "الخدمات",
    "more": "المزيد"
  },
  "profile": {
    "basicInformation": "البيانات الأساسية",
    "editProfile": "تعديل الملف الشخصي",
    "location": "الموقع",
    "fav": "المفضلة",
    "joinService": "انضم إلينا كمقدم خدمة",
    "exitApp": "الخروج من التطبيق",
    "logout": "تسجيل الخروج",
    "deleteAccount": "حذف الحساب",
    "profileTitle": "الملف الشخصي",
    "changePassword": "تغيير كلمة المرور",
    "editPasswordTitle": "تعديل كلمة المرور",
    "completeSuccessfully": "تمت بنجاح",
    "passwordChangesSuccessfully": "تم تغيير كلمة المرور الخاصة بك بنجاح",
    "backToProfile": "العودة للملف الشخصي",
    "switchAccount": "تبديل الحساب",
    "easySwitch": "يمكنك التنقل بين حساباتك بسهولة",
    "sureDelete": "هل أنت متأكد من رغبتك في حذف الحساب؟",
    "sureLogout": "هل أنت متأكد من رغبتك في تسجيل الخروج؟",
    "enterPasswordTitle": "ادخل كلمة المرور",
    "enterPasswordSubtitle": "قم بإدخال كلمة المرور لتأكيد حذف الحساب"
  },
  "back": "العودة"
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
    "welcomeBack": "Welcome back",
    "phoneNumber": "Phone Number",
    "password": "Password",
    "forgetPasswordQu": "Forgot Password?",
    "loginButton": "Login",
    "notHaveAccount": "Don’t have an account?",
    "createNewAccount": "Create a new account",
    "forgetPasswordTitle": "Forgot Password",
    "loginTitle": "Login",
    "enterDigits": "Enter the 4-digit code that was sent to your phone number",
    "resendAgain": "Resend again",
    "newPasswordTitle": "New Password",
    "newPasswordHint": "New Password",
    "confirmNewPasswordHint": "New Password Again",
    "createNewAccountTitle": "Create a new account",
    "takeTwoSteps": "It only takes two steps!",
    "firstNameHint": "First Name",
    "lastNameHint": "Last Name",
    "alreadyHaveAccount": "Already have an account?",
    "verifyAccountTitle": "Verify your account",
    "fieldRequired": "This field is required",
    "passwordValidation": "The password must be at least 8 characters long",
    "selectCountry": "Select Country",
    "enterNewPassword": "Enter the new password twice, then proceed to login",
    "passwordMinValidation": "The password must be at least 8 characters long",
    "passwordMaxValidation": "The password must not exceed 20 characters",
    "nameValidation": "The username must be at least 2 characters long",
    "phoneValidation": "The phone number must be at least 9 digits long",
    "passwordAgain": "Password Again",
    "passwordMismatch": "The passwords must match",
    "currentPassword": "Current Password"
  },
  "next": "Next",
  "save": "Save",
  "bottomNavigationBar": {
    "home": "Home",
    "profile": "My Account",
    "services": "Services",
    "more": "More"
  },
  "profile": {
    "basicInformation": "Basic Information",
    "editProfile": "Edit Profile",
    "location": "Location",
    "fav": "Favorites",
    "joinService": "Join us as a service provider",
    "exitApp": "Exit App",
    "logout": "Log Out",
    "deleteAccount": "Delete Account",
    "profileTitle": "Profile",
    "changePassword": "Change Password",
    "editPasswordTitle": "Edit Password",
    "completeSuccessfully": "Completed Successfully",
    "passwordChangesSuccessfully": "Your password has been changed successfully",
    "backToProfile": "Back to Profile",
    "switchAccount": "Switch Account",
    "easySwitch": "You can switch between your accounts easily",
    "sureDelete": "Are you sure you want to delete the account?",
    "sureLogout": "Are you sure you want to log out?",
    "enterPasswordTitle": "Enter Password",
    "enterPasswordSubtitle": "Enter your password to confirm account deletion"
  },
  "back": "Back"
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
    "welcomeBack": "واپسی پر خوش آمدید",
    "phoneNumber": "فون نمبر",
    "password": "پاس ورڈ",
    "forgetPasswordQu": "پاس ورڈ بھول گئے؟",
    "loginButton": "لاگ ان کریں",
    "notHaveAccount": "کیا آپ کا اکاؤنٹ نہیں ہے؟",
    "createNewAccount": "نیا اکاؤنٹ بنائیں",
    "forgetPasswordTitle": "پاس ورڈ بھول گئے",
    "loginTitle": "لاگ ان",
    "enterDigits": "وہ 4 ہندسوں کا کوڈ درج کریں جو آپ کے فون نمبر پر بھیجا گیا ہے",
    "resendAgain": "دوبارہ بھیجیں",
    "newPasswordTitle": "نیا پاس ورڈ",
    "newPasswordHint": "نیا پاس ورڈ",
    "confirmNewPasswordHint": "نیا پاس ورڈ دوبارہ درج کریں",
    "createNewAccountTitle": "نیا اکاؤنٹ بنائیں",
    "takeTwoSteps": "اس میں صرف دو مراحل درکار ہیں !",
    "firstNameHint": "پہلا نام",
    "lastNameHint": "آخری نام",
    "alreadyHaveAccount": "کیا آپ کا پہلے سے اکاؤنٹ ہے؟",
    "verifyAccountTitle": "اپنے اکاؤنٹ کی تصدیق کریں",
    "fieldRequired": "یہ خانہ لازمی ہے",
    "passwordValidation": "پاس ورڈ کم از کم 8 حروف پر مشتمل ہونا چاہیے",
    "selectCountry": "ملک منتخب کریں",
    "enterNewPassword": "نیا پاس ورڈ دو بار درج کریں، پھر لاگ ان کے لیے آگے بڑھیں",
    "passwordMinValidation": "پاس ورڈ کم از کم 8 حروف پر مشتمل ہونا چاہیے",
    "passwordMaxValidation": "پاس ورڈ 20 حروف سے زیادہ نہیں ہونا چاہیے",
    "nameValidation": "صارف کا نام کم از کم 2 حروف پر مشتمل ہونا چاہیے",
    "phoneValidation": "فون نمبر کم از کم 9 ہندسوں پر مشتمل ہونا چاہیے",
    "passwordAgain": "پاس ورڈ دوبارہ درج کریں",
    "passwordMismatch": "پاس ورڈز ایک جیسے ہونے چاہئیں",
    "currentPassword": "موجودہ پاس ورڈ"
  },
  "next": "اگلا",
  "save": "محفوظ کریں",
  "bottomNavigationBar": {
    "home": "مرکزی صفحہ",
    "profile": "میرا اکاؤنٹ",
    "services": "خدمات",
    "more": "مزید"
  },
  "profile": {
    "basicInformation": "بنیادی معلومات",
    "editProfile": "پروفائل میں ترمیم کریں",
    "location": "مقام",
    "fav": "پسند",
    "joinService": "بطور سروس فراہم کنندہ ہمارے ساتھ شامل ہوں",
    "exitApp": "ایپ سے باہر نکلیں",
    "logout": "لاگ آؤٹ کریں",
    "deleteAccount": "اکاؤنٹ حذف کریں",
    "profileTitle": "پروفائل",
    "changePassword": "پاس ورڈ تبدیل کریں",
    "editPasswordTitle": "پاس ورڈ میں ترمیم کریں",
    "completeSuccessfully": "کامیابی سے مکمل ہوا",
    "passwordChangesSuccessfully": "آپ کا پاس ورڈ کامیابی سے تبدیل ہو گیا",
    "backToProfile": "پروفائل پر واپس جائیں",
    "switchAccount": "اکاؤنٹ تبدیل کریں",
    "easySwitch": "آپ اپنے اکاؤنٹس کے درمیان آسانی سے منتقل ہو سکتے ہیں",
    "sureDelete": "کیا آپ واقعی اپنا اکاؤنٹ حذف کرنا چاہتے ہیں؟",
    "sureLogout": "کیا آپ واقعی لاگ آؤٹ کرنا چاہتے ہیں؟",
    "enterPasswordTitle": "پاس ورڈ درج کریں",
    "enterPasswordSubtitle": "اکاؤنٹ حذف کی تصدیق کے لیے اپنا پاس ورڈ درج کریں"
  },
  "back": "واپس جائیں"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en, "ur": _ur};
}

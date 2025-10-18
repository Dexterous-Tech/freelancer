import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/routes/app_routing.dart';
import 'core/di/injection_container.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // final systemLang = PlatformDispatcher.instance.locale.languageCode;
  //
  // await SharedPreferencesHelper.setString(
  //   SharedPreferencesKey.currentCodeKey,
  //   systemLang,
  // );
  // Register all GetIt dependencies
  await initializeDependencies();
  await sl.allReady();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar'), Locale('ur')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('ar'),
      assetLoader: CodegenLoader(),
      startLocale: Locale('ar'),
      saveLocale: true,
      child: const FreeLancerApp(),
    ),
  );
}

class FreeLancerApp extends StatefulWidget {
  const FreeLancerApp({super.key});

  @override
  State<FreeLancerApp> createState() => _FreeLancerAppState();
}

class _FreeLancerAppState extends State<FreeLancerApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Listen to locale changes from easy_localization
    context.locale; // This makes the widget rebuild when locale changes
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        onGenerateRoute: (setting) => AppRouting().onGenerateRouting(setting),
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}

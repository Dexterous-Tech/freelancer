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
      child: FreeLancerApp(),
    ),
  );
}

class FreeLancerApp extends StatelessWidget {
  const FreeLancerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: (setting) => AppRouting().onGenerateRouting(setting),
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}

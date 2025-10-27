import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/theme/spacing.dart';

import '../../../../../../core/helper/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late Animation<double> _shrinkWidth;
  late Animation<double> _shrinkHeight;
  late Animation<double> _growWidth;
  late Animation<double> _growHeight;

  late AnimationController _secondLogoController;
  late Animation<double> _secondLogoHeight;
  late Animation<double> _secondLogoOpacity;

  @override
  void initState() {
    super.initState();

    // Step 1 controller: shrink animation
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _shrinkWidth = Tween<double>(begin: 219, end: 126).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOut),
    );

    _shrinkHeight = Tween<double>(begin: 139, end: 80).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOut),
    );

    // Step 2+3 controllers (run together)
    _secondLogoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _growWidth = Tween<double>(begin: 126, end: 140).animate(
      CurvedAnimation(parent: _secondLogoController, curve: Curves.easeOutBack),
    );
    _growHeight = Tween<double>(begin: 80, end: 88).animate(
      CurvedAnimation(parent: _secondLogoController, curve: Curves.easeOutBack),
    );

    _secondLogoHeight = Tween<double>(begin: 0, end: 33).animate(
      CurvedAnimation(parent: _secondLogoController, curve: Curves.easeOut),
    );

    _secondLogoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _secondLogoController, curve: Curves.easeIn),
    );

    // Start step 1 (shrink)
    _mainController.forward();

    // After step 1 ends → small pause → then start both grow + logo
    _mainController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(milliseconds: 300));
        _secondLogoController.forward();
      }
    });

    // After step 2+3 end → navigate
    _secondLogoController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      context.pushNamedAndRemoveUntil(AppRoutes.languageScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([_mainController, _secondLogoController]),
          builder: (context, child) {
            final double currentWidth =
                _secondLogoController.isAnimating ||
                    _secondLogoController.isCompleted
                ? _growWidth.value
                : _shrinkWidth.value;
            final double currentHeight =
                _secondLogoController.isAnimating ||
                    _secondLogoController.isCompleted
                ? _growHeight.value
                : _shrinkHeight.value;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App main logo
                Image.asset(
                  AppImages.appLogo,
                  width: currentWidth.w,
                  height: currentHeight.h,
                ),
                verticalSpace(14.h),

                // Freelancer logo (reveals smoothly)
                Opacity(
                  opacity: _secondLogoOpacity.value,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: _secondLogoHeight.value / 33,
                      child: Image.asset(
                        AppImages.freelancerLogo,
                        width: 210.w,
                        height: 33.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mainController.dispose();
    _secondLogoController.dispose();
    super.dispose();
  }
}

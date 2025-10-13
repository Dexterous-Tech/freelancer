import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelancer/core/theme/spacing.dart';

import '../../../../../core/helper/app_images.dart';

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

    // Main logo animation controller
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Step 1 → shrink
    _shrinkWidth = Tween<double>(begin: 219, end: 126).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    _shrinkHeight = Tween<double>(begin: 139, end: 80).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Step 2 → grow slightly
    _growWidth = Tween<double>(begin: 126, end: 140).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    _growHeight = Tween<double>(begin: 80, end: 88).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Second logo animation
    _secondLogoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _secondLogoHeight = Tween<double>(begin: 0, end: 33).animate(
      CurvedAnimation(parent: _secondLogoController, curve: Curves.easeOut),
    );

    _secondLogoOpacity = Tween<double>(begin: 1, end: 1).animate(
      CurvedAnimation(parent: _secondLogoController, curve: Curves.easeIn),
    );

    // Start first animation
    _mainController.forward();

    // When the first animation is done → start the second logo
    _mainController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _secondLogoController.forward();
      }
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
            // compute current logo size
            final currentWidth = _mainController.value < 0.5
                ? _shrinkWidth.value
                : _growWidth.value;
            final currentHeight = _mainController.value < 0.5
                ? _shrinkHeight.value
                : _growHeight.value;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First logo
                Image.asset(
                  AppImages.appLogo,
                  width: currentWidth.w,
                  height: currentHeight.h,
                ),
                verticalSpace(14),

                // Second logo (smooth reveal)
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

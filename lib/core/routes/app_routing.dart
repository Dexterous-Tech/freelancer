import 'package:flutter/material.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/features/on_boarding/presentation/view/on_boarding_screen.dart';
import 'package:freelancer/features/splash/splash/presentation/view/splash_screen.dart';

class AppRouting {
  Route onGenerateRouting(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return _pageRouteBuilder(const SplashScreen());
      case AppRoutes.languageScreen:
        return _pageRouteBuilder(const OnBoardingScreen());
      default:
        return _pageRouteBuilder(const Scaffold());
    }
  }

  /// Custom PageRouteBuilder using slide + fade transition
  PageRouteBuilder _pageRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return _slideAndFade(context, animation, secondaryAnimation, child);
      },
      transitionDuration: const Duration(milliseconds: 800),
    );
  }

  /// Slide from right (0.3 offset) and fade in smoothly
  static Widget _slideAndFade(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0.0),
      end: Offset.zero,
    ).animate(CurveTween(curve: Curves.easeOutCubic).animate(animation));

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}

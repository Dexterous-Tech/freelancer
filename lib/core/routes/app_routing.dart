import 'package:flutter/material.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/forget_password_screen.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/login/presentation/view/login_screen.dart';
import 'package:freelancer/features/auth/new_password_screen/presentation/view/new_password_screen.dart';
import 'package:freelancer/features/auth/signup/presentation/view/signup_screen.dart';
import 'package:freelancer/features/auth/verification/presentation/view/verification_screen.dart';
import 'package:freelancer/features/client/change_password/presentation/view/client_change_password_screen.dart';
import 'package:freelancer/features/client/profile/data/models/profile_models.dart';

import '../../features/client/edit_profile/presentation/view/client_edit_profile_screen.dart';
import '../../features/common/about_us/presentation/view/about_us_screen.dart';
import '../../features/common/on_boarding/presentation/view/on_boarding_screen.dart';
import '../../features/common/privacy_policy/presentation/view/privacy_policy_screen.dart';
import '../../features/common/splash/splash/presentation/view/splash_screen.dart';
import '../../features/home/presentation/view/main_home_screen.dart';

class AppRouting {
  Route onGenerateRouting(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return _pageRouteBuilder(const SplashScreen());
      case AppRoutes.languageScreen:
        return _pageRouteBuilder(const OnBoardingScreen());
      case AppRoutes.loginScreen:
        return _pageRouteBuilder(const LoginScreen());
      case AppRoutes.forgetScreen:
        return _pageRouteBuilder(
          ForgetPasswordScreen(
            phoneNumber: arguments as ForgetPasswordRequestBodyModel,
          ),
        );
      case AppRoutes.newPasswordScreen:
        return _pageRouteBuilder(
          NewPasswordScreen(
            forgetPasswordRequestBodyModel:
                arguments as ForgetPasswordRequestBodyModel,
          ),
        );
      case AppRoutes.signupScreen:
        return _pageRouteBuilder(const SignupScreen());
      case AppRoutes.mainHomeScreen:
        return _pageRouteBuilder(const MainHomeScreen());
      case AppRoutes.verificationScreen:
        return _pageRouteBuilder(
          VerificationScreen(
            phoneNumberModel: arguments as ForgetPasswordRequestBodyModel,
          ),
        );
      case AppRoutes.clientEditProfileScreen:
        return _pageRouteBuilder(
          ClientEditProfileScreen(
            profileDataModel: arguments as ProfileDataModel,
          ),
        );
      case AppRoutes.clientChangePasswordScreen:
        return _pageRouteBuilder(const ClientChangePasswordScreen());
      case AppRoutes.aboutUsScreen:
        return _pageRouteBuilder(const AboutUsScreen());
      case AppRoutes.privacyPolicyScreen:
        return _pageRouteBuilder(const PrivacyPolicyScreen());
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

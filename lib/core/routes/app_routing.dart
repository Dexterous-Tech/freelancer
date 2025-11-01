import 'package:flutter/material.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/features/auth/forget_password/presentation/view/forget_password_screen.dart';
import 'package:freelancer/features/auth/login/data/models/forget_password_model.dart';
import 'package:freelancer/features/auth/login/presentation/view/login_screen.dart';
import 'package:freelancer/features/auth/new_password_screen/presentation/view/new_password_screen.dart';
import 'package:freelancer/features/auth/signup/presentation/view/signup_screen.dart';
import 'package:freelancer/features/auth/verification/presentation/view/verification_screen.dart';
import 'package:freelancer/features/common/change_password/presentation/view/change_password_screen.dart';
import 'package:freelancer/features/common/edit_profile/data/models/update_profile_model.dart';
import 'package:freelancer/features/client/join_us/presentation/view/join_us_screen.dart';
import 'package:freelancer/features/common/profile/data/models/profile_models.dart';
import 'package:freelancer/features/client/service_provider/presentation/view/service_provider_screen.dart';
import 'package:freelancer/features/client/service_provider_details/presentation/view/service_provider_details_screen.dart';
import 'package:freelancer/features/client/services_favourite/presentation/view/services_favourite_screen.dart';
import 'package:freelancer/features/common/contact_us/presentation/view/contact_us_screen.dart';
import 'package:freelancer/features/common/request_speciality/presentation/view/request_speciality_screen.dart';

import '../../features/common/edit_profile/presentation/view/client_edit_profile_screen.dart';
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
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case AppRoutes.languageScreen:
        return _animatedRoute(const OnBoardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case AppRoutes.forgetScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ForgetPasswordScreen(
            phoneNumber: arguments as ForgetPasswordRequestBodyModel,
          ),
        );
      case AppRoutes.newPasswordScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => NewPasswordScreen(
            forgetPasswordRequestBodyModel:
                arguments as ForgetPasswordRequestBodyModel,
          ),
        );
      case AppRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignupScreen(),
        );
      case AppRoutes.mainHomeScreen:
        if (arguments is int) {
          return _animatedRoute(MainHomeScreen(index: arguments));
        }
        return _animatedRoute(MainHomeScreen());
      case AppRoutes.verificationScreen:
        if (arguments is VerificationUpdateProfile) {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                VerificationScreen(verificationUpdateProfile: arguments),
          );
        } else if (arguments is ForgetPasswordRequestBodyModel) {
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                VerificationScreen(phoneNumberModel: arguments),
          );
        } else {
          return MaterialPageRoute(
            builder: (BuildContext context) => VerificationScreen(),
          );
        }
      case AppRoutes.clientEditProfileScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ClientEditProfileScreen(
            profileDataModel: arguments as ProfileDataModel,
          ),
        );
      case AppRoutes.clientChangePasswordScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChangePasswordScreen(),
        );
      case AppRoutes.aboutUsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AboutUsScreen(),
        );
      case AppRoutes.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const PrivacyPolicyScreen(),
        );
      case AppRoutes.serviceProviderScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ServiceProviderScreen(),
        );
      case AppRoutes.serviceFavouriteScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ServicesFavouriteScreen(),
        );
      case AppRoutes.joinUsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const JoinUsScreen(),
        );
      case AppRoutes.contactUsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ContactUsScreen(),
        );
      case AppRoutes.requestSpecialityScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RequestSpecialityScreen(),
        );
      case AppRoutes.serviceProviderDetailsScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              ServiceProviderDetailsScreen(id: arguments as int),
        );
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Scaffold(),
        );
    }
  }

  PageRouteBuilder _animatedRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Soft cubic ease (starts slow, ends smooth)
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );

        // Fade from 0 → 1 softly
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curved),
          child: child,
        );
      },
    );
  }

  /// Custom PageRouteBuilder using slide + fade transition
  // PageRouteBuilder _pageRouteBuilder(Widget screen) {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => screen,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return _slideAndFade(context, animation, secondaryAnimation, child);
  //     },
  //     transitionDuration: const Duration(milliseconds: 800),
  //   );
  // }
  //
  // /// Slide from right (0.3 offset) and fade in smoothly
  // static Widget _slideAndFade(
  //   BuildContext context,
  //   Animation<double> animation,
  //   Animation<double> secondaryAnimation,
  //   Widget child,
  // ) {
  //   final slideAnimation = Tween<Offset>(
  //     begin: const Offset(0.3, 0.0),
  //     end: Offset.zero,
  //   ).animate(CurveTween(curve: Curves.easeOutCubic).animate(animation));
  //
  //   return SlideTransition(
  //     position: slideAnimation,
  //     child: FadeTransition(opacity: animation, child: child),
  //   );
  // }
}

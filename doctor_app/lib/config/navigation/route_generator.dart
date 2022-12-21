import 'package:flutter/material.dart';

import '../../presentation/pages/auth/pages/login_page.dart';
import '../../presentation/pages/auth/pages/register_page.dart';

import '../../presentation/pages/reservations/reservations.dart';
import '../../presentation/pages/splash/splash.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return pageRoute(const SplashPage());
      case Routes.loginScreen:
        return pageRoute(const LoginScreen());
      case Routes.signupScreen:
        return pageRoute(const SignupScreen());

      case Routes.reservationsPage:
        return pageRoute(const ReservationsPage());

      default:
        return pageRoute(const SplashPage());
    }
  }
}

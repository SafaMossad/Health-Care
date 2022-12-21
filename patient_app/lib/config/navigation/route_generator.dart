import 'package:flutter/material.dart';

import '../../presentation/pages/auth/pages/login_page.dart';
import '../../presentation/pages/auth/pages/register_page.dart';
import '../../presentation/pages/bottom_navigation_bar/bottom_navigation_page.dart';
import '../../presentation/pages/doctor_details/page/doctor_details_page.dart';
import '../../presentation/pages/home/home.dart';
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
      case Routes.homePage:
        return pageRoute(const HomePage());
      case Routes.doctorDetails:
        final args = settings.arguments as Map<String, dynamic>;
        //return pageRoute(const DoctorDetailsPage());
        return pageRoute(DoctorDetailsPage(
          doctorData: args["doctorData"],
        ));
      case Routes.reservationsPage:
        return pageRoute(const ReservationsPage());
      case Routes.bottomNavigationPage:
        return pageRoute(const BottomNavigationPage());

      default:
        return pageRoute(const SplashPage());
    }
  }
}

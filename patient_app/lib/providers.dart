import 'package:flutter/cupertino.dart';
import 'package:patient_app/di_container.dart';
import 'package:patient_app/presentation/pages/auth/view_model/auth_login_view_model.dart';
import 'package:patient_app/presentation/pages/auth/view_model/auth_register_view_model.dart';
import 'package:patient_app/presentation/pages/home/view_model/doctors_view_model.dart';
import 'package:patient_app/presentation/pages/home/view_model/request_doctor_view_model.dart';
import 'package:patient_app/presentation/pages/profile/view_model/profile_view_model.dart';
import 'package:patient_app/presentation/pages/reservations/view_model/reservation_view_model.dart';
import 'package:patient_app/presentation/pages/top_rate_doctors/view_model/top_rate_doctors_view_model.dart';

import 'package:provider/provider.dart';

import 'domain/provider/local_auth_provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sl<LocalAuthProvider>()),
        ChangeNotifierProvider(create: (context) => sl<RegisterViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<DoctorsViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<LoginViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<RequestDoctorsViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<ReservationsViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<ProfileViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<TopRateDoctorsViewModel>()),

      ],
      child: child,
    );
  }
}

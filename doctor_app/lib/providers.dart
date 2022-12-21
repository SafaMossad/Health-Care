import 'package:doctor_app/di_container.dart';
import 'package:doctor_app/presentation/pages/auth/view_model/auth_login_view_model.dart';
import 'package:doctor_app/presentation/pages/auth/view_model/auth_register_view_model.dart';
import 'package:doctor_app/presentation/pages/reservations/view_model/reservation_view_model.dart';
import 'package:flutter/cupertino.dart';

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
        ChangeNotifierProvider(create: (context) => sl<LoginViewModel>()),
        ChangeNotifierProvider(create: (context) => sl<ReservationsViewModel>()),

      ],
      child: child,
    );
  }
}

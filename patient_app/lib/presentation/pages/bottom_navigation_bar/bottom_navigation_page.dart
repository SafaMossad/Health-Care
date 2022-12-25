import 'package:flutter/material.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:patient_app/presentation/pages/profile/home.dart';
import 'package:provider/provider.dart';
import '../../../../domain/provider/local_auth_provider.dart';
import '../../component/constants/constant.dart';
import '../home/home.dart';
import '../reservations/reservations.dart';
import '../top_rate_doctors/pages/top_rate_doctors.dart';


class BottomNavigationPage extends StatefulWidget {

  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),

    const TopRateDoctorsPage(),
    const ReservationsPage(),
    const ProfilePage(),
  ];
  @override
  void initState() {
    Provider.of<LocalAuthProvider>(context,
        listen: false)
        .isLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            //  color: Colors.green,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              elevation: 2,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              selectedLabelStyle: const TextStyle(fontSize: 0),
              selectedItemColor: ColorManager.primaryColor,
              unselectedItemColor: ColorManager.grey,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
               const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: "To Rate Doctors",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.work_history),
                  label: "My Reservation",
                ),
              const  BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),

              ],
            ),
          ),
        ),
        body: screens[currentIndex]);
  }
}

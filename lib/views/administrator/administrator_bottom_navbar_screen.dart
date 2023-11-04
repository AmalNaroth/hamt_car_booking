import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/utils/color_constants.dart';
import 'package:xmt_car_booking_app/view_models/administrator/bottomnav_bar_viewmodels_administrator.dart';
import 'package:xmt_car_booking_app/views/administrator/administrator_drivercheck_screen.dart';
import 'package:xmt_car_booking_app/views/administrator/administrator_home_screen.dart';

class AdministratorBottomNavBar extends StatelessWidget {
  AdministratorBottomNavBar({super.key});

  static String administratorBottomNavBar = "Administrator-HomeScreen";

  final administratorScreens = [
    AdministratorHomeScreen(),
    AdministratorDriverCheckScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AdministratorBottomNavBarViewModel>(
      builder: (context, bnvalue, child) {
        return Scaffold(
          body: administratorScreens[bnvalue.getCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bnvalue.currectIndex,
            onTap: (value) {
              bnvalue.setCurrectIndex = value;
            },
            selectedItemColor: blackColor,
            unselectedItemColor: Colors.grey,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.drive_eta_rounded), label: "Driver")
          ]),
        );
      },
    );
  }
}

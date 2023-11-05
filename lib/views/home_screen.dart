import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/views/administrator/administrator_bottom_navbar_screen.dart';
import 'package:xmt_car_booking_app/views/driver/driver_home_screen.dart';
import 'package:xmt_car_booking_app/views/employees/employee_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String homeScreen = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EmployeesHomeScreen.employeesHomeScreen);
              },
              child: Text("Employees"),
            ),
            fHight20,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    AdministratorBottomNavBar.administratorBottomNavBar,
                    );
              },
              child: Text("Administrator"),
            ),
            fHight20,
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DriverHomeScreen(),
                  ),
                );
              },
              child: Text("Driver"),
            )
          ],
        ),
      ),
    );
  }
}

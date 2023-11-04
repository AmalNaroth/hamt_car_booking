import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/repo/firebase_options.dart';
import 'package:xmt_car_booking_app/view_models/administrator/administator_home_viewmodel.dart';
import 'package:xmt_car_booking_app/view_models/administrator/bottomnav_bar_viewmodels_administrator.dart';
import 'package:xmt_car_booking_app/view_models/authentication/login_screen_view_model.dart';
import 'package:xmt_car_booking_app/view_models/authentication/sing_up_view_model.dart';
import 'package:xmt_car_booking_app/view_models/employees/employee_activity_view_models.dart';
import 'package:xmt_car_booking_app/view_models/employees/employee_services_view_models.dart';
import 'package:xmt_car_booking_app/view_models/splash_screen_view_models.dart';
import 'package:xmt_car_booking_app/views/administrator/administator_trip_details.dart';
import 'package:xmt_car_booking_app/views/administrator/administrator_bottom_navbar_screen.dart';
import 'package:xmt_car_booking_app/views/authentication/login_screen.dart';
import 'package:xmt_car_booking_app/views/authentication/signup_screen.dart';
import 'package:xmt_car_booking_app/views/employees/employee_home_screen.dart';
import 'package:xmt_car_booking_app/views/home_screen.dart';
import 'package:xmt_car_booking_app/views/splah_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdministratorBottomNavBarViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmployeeServicesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmployeeServicesViewmodels(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdministatorHomeViewModel(),
        ),
      ],
      child: MaterialApp(
        title: "Car booking app",
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.splashScreen,
        routes: {
          SplashScreen.splashScreen: (_) => const SplashScreen(),
          LoginScreen.loginScreen: (_) => LoginScreen(),
          HomeScreen.homeScreen: (_) => HomeScreen(),
          SignUpScreen.singupScreen: (context) => SignUpScreen(),
          EmployeesHomeScreen.employeesHomeScreen: (context) =>
              EmployeesHomeScreen(),
          AdministratorBottomNavBar.administratorBottomNavBar: (context) =>
              AdministratorBottomNavBar(),
          AdministratorTripDetails.administratorTripDetails: (context) =>
              AdministratorTripDetails(),
        },
      ),
    );
  }
}

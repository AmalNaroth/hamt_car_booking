import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/view_models/splash_screen_view_models.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String splashScreen = "Splash-Screen";

  @override
  Widget build(BuildContext context) {
    context.read<SplashScreenViewModel>().changeSplashFun(context);
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Buchprufer",
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

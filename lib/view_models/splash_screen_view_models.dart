import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/views/authentication/login_screen.dart';

class SplashScreenViewModel extends ChangeNotifier {
  changeSplashFun(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.loginScreen);
    });
  }
}

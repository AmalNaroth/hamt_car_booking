import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/views/authentication/login_screen.dart';
import 'package:xmt_car_booking_app/views/home_screen.dart';

class SplashScreenViewModel extends ChangeNotifier {
  changeSplashFun(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      final screen = StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          return LoginScreen();
        },
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );
    });
  }
}

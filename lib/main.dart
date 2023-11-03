import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/repo/firebase_options.dart';
import 'package:xmt_car_booking_app/view_models/splash_screen_view_models.dart';
import 'package:xmt_car_booking_app/views/authentication/login_screen.dart';
import 'package:xmt_car_booking_app/views/splah_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashScreenViewModel(),)
      ],
      child: MaterialApp(
        title: "Car booking app",
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.splashScreen,
        routes: {
          SplashScreen.splashScreen : (_)=> const SplashScreen(),
          LoginScreen.loginScreen :(context) => const LoginScreen()
        },
      ),
    );
  }
}
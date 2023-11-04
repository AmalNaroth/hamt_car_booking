import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/views/home_screen.dart';
import 'package:xmt_car_booking_app/views/widgets/snackbar_widget.dart';

class LoginProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? cred;
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  bool isLoading = false;

  TextEditingController get emailGet => _emailContoller;
  TextEditingController get passwordGet => _passWordController;
  bool get linearPrograss => isLoading;

  Future<void> LoginFunction(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (_emailContoller.text.isNotEmpty &&
        _passWordController.text.isNotEmpty) {
      try {
        cred = await _auth.signInWithEmailAndPassword(
            email: _emailContoller.text, password: _passWordController.text);
        customSnackBar("Login Success", context);
        Navigator.of(context).pushReplacementNamed(HomeScreen.homeScreen);
        _emailContoller.clear();
        _passWordController.clear();
      } catch (err) {
        customSnackBar(err.toString(), context);
      }
    } else {
      customSnackBar("Enter all the details", context);
    }
    isLoading = false;
    notifyListeners();
  }
}

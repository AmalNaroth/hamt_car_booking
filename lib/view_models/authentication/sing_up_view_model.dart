import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmt_car_booking_app/views/home_screen.dart';
import 'package:xmt_car_booking_app/views/widgets/snackbar_widget.dart';

class SignUpProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  UserCredential ? cred;

  bool isLoading=false;

  TextEditingController get emailGet => _emailContoller;
  TextEditingController get passwordGet => _passWordController;
  bool get linearPrograss=>isLoading;

  Future<void> signupFunction({required BuildContext context}) async{
    if(_emailContoller.text.isNotEmpty && _passWordController.text.isNotEmpty){
      isLoading=true;
      notifyListeners();
      try{
        cred=await _auth.createUserWithEmailAndPassword(email: _emailContoller.text, password: _passWordController.text);
        customSnackBar("Signup Success", context);
        Navigator.of(context).pushReplacementNamed(HomeScreen.homeScreen);
        _emailContoller.clear();
        _passWordController.clear();
      }catch(err){
        customSnackBar(err.toString(), context);
        notifyListeners();
      }
    }else{
      customSnackBar("Enter all the details", context);
    }
    isLoading=false;
    notifyListeners();
  }
}

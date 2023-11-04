import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/utils/color_constants.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/view_models/authentication/sing_up_view_model.dart';
import 'package:xmt_car_booking_app/views/widgets/form_widget.dart';
import 'package:xmt_car_booking_app/views/widgets/text_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static String singupScreen = "Signup-Screen";

  void callSignUP(BuildContext context) async {
    await Provider.of<SignUpProvider>(context,listen: false).signupFunction(context: context);
  }

  @override
  Widget build(BuildContext context) {
   final signUpProvider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextWidget(
                  text: "Tell Us About You!",
                  color: textBlackColor,
                  size: 28,
                  bold: FontWeight.bold,
                ),
                fHight10,
                TextWidget(
                    text: "Make it work, make it right, make it fast",
                    color: textBlackColor,
                    size: 15),
                fHight20,
                TextFormFieldWidget(
                    controller: signUpProvider.emailGet,
                    icon: Icons.email_outlined,
                    hinttext: "E-Mail"),
                fHight20,
                TextFormFieldWidget(
                    controller: signUpProvider.passwordGet,
                    icon: Icons.fingerprint_outlined,
                    suffixIconTrue: Icons.visibility_off_outlined,
                    suffixIconFalse: Icons.visibility_outlined,
                    hinttext: "Password"),
                fHight30,
                GestureDetector(
                  onTap: () {
                    callSignUP(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextWidget(
                          text: "Register", color: textWhiteColor, size: 16),
                    ),
                  ),
                ),
                fHight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        text: "Already have an account?",
                        color: textBlackColor,
                        size: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: TextWidget(
                        text: "Login",
                        color: textBlackColor,
                        size: 15,
                        bold: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: signUpProvider.linearPrograss,
                  child: LinearProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

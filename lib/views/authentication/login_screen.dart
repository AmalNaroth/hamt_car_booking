import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmt_car_booking_app/utils/color_constants.dart';
import 'package:xmt_car_booking_app/utils/size_constants.dart';
import 'package:xmt_car_booking_app/view_models/authentication/login_screen_view_model.dart';
import 'package:xmt_car_booking_app/views/authentication/signup_screen.dart';
import 'package:xmt_car_booking_app/views/widgets/form_widget.dart';
import 'package:xmt_car_booking_app/views/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String loginScreen = "Login-Screen";

  void movetoSignPp(BuildContext context) {
    final signUp = MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    );
    Navigator.of(context).push(signUp);
  }

  void callLoginFunction(BuildContext context) async{
    await Provider.of<LoginProvider>(context,listen: false).LoginFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    final signingProvider=Provider.of<LoginProvider>(context);
    //final googleSigninProvider=Provider.of<GoogleSigningProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                fHight50,
                TextWidget(
                  text: "Welcome Back!",
                  color: textBlackColor,
                  size: 30,
                  bold: FontWeight.w500,
                ),
                fHight10,
                TextWidget(
                    text: "Make it work, make it right, make it fast",
                    color: textBlackColor,
                    size: 15),
                fHight20,
                TextFormFieldWidget(
                    controller: signingProvider.emailGet,
                    icon: Icons.email_outlined,
                    hinttext: "E-Mail"),
                fHight20,
                TextFormFieldWidget(
                    controller: signingProvider.passwordGet,
                    icon: Icons.fingerprint_outlined,
                    suffixIconTrue: Icons.visibility_off_outlined,
                    suffixIconFalse: Icons.visibility_outlined,
                    hinttext: "Password"),
                fHight10,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      
                    },
                    child: TextWidget(
                      text: "Foregot password?",
                      color: textBlackColor,
                      size: 15,
                      bold: FontWeight.w700,
                    ),
                  ),
                ),
                fHight10,
                GestureDetector(
                  onTap: () {
                    callLoginFunction(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextWidget(
                          text: "Login", color: textWhiteColor, size: 16),
                    ),
                  ),
                ),
                fHight25,
                Center(
                    child: TextWidget(
                        text: "OR", color: textBlackColor, size: 15)),
                fHight25,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Color.fromARGB(255, 214, 214, 214),
                    elevation: 0,
                    side: BorderSide(width: 1),
                  ),
                  onPressed: () async {
                   //await googleSigninProvider.signIngWithGoogleFunction(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google-logo.png",
                        height: 30,
                      ),
                      fWidth20,
                      TextWidget(
                          text: "Login with google",
                          color: textBlackColor,
                          size: 15)
                    ],
                  ),
                ),
                fHight20,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Color.fromARGB(255, 214, 214, 214),
                    elevation: 0,
                    side: BorderSide(width: 1),
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => MobileOTP1(),
                    // ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_iphone_outlined,
                        color: Color.fromARGB(255, 0, 13, 113),
                      ),
                      fWidth20,
                      TextWidget(
                          text: "Login with mobile",
                          color: textBlackColor,
                          size: 15),
                    ],
                  ),
                ),
                fHight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        text: "Don't have an account?",
                        color: textBlackColor,
                        size: 15),
                    TextButton(
                        onPressed: () {
                          movetoSignPp(context);
                        },
                        child: TextWidget(
                          text: "Register",
                          color: textBlackColor,
                          size: 15,
                          bold: FontWeight.w600,
                        ))
                  ],
                ),
                Visibility(
                  visible: signingProvider.linearPrograss,
                  child: LinearProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

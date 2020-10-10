//import 'package:flutter/material.dart';
//import 'package:techathon/Screens/Login/login_screen.dart';
//import 'package:techathon/Screens/Signup/components/background.dart';
//import 'package:techathon/Screens/Signup/components/or_divider.dart';
//import 'package:techathon/Screens/Signup/components/social_icon.dart';
//import 'package:techathon/components/already_have_an_account_acheck.dart';
//import 'package:techathon/components/rounded_button.dart';
//import 'package:techathon/components/rounded_input_field.dart';
//import 'package:techathon/components/rounded_password_field.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:techathon/menu.dart';
//import 'package:techathon/widget.dart';
//
//class Body extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Background(
//
//      child: SingleChildScrollView(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              "SIGNUP",
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//            SizedBox(height: size.height * 0.03),
//            SvgPicture.asset(
//              "assets/icons/signup.svg",
//              height: size.height * 0.35,
//            ),
//            RoundedInputField(
//              hintText: "Your Email",
//              onChanged: (value) {},
//            ),
//            RoundedPasswordField(
//              onChanged: (value) {},
//            ),
//            RoundedButton(
//              text: "SIGNUP",
//              press: () {},
//            ),
//            SizedBox(height: size.height * 0.03),
//            AlreadyHaveAnAccountCheck(
//              login: false,
//              press: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) {
//                      return LoginScreen();
//                    },
//                  ),
//                );
//              },
//            ),
//            OrDivider(),
//
//            //guest
//            GestureDetector(
//              onTap: (){
//                Navigator.pushReplacement(context, MaterialPageRoute(
//                    builder: (context) => menu()
//                ));
//
//              },
//              child: Text(
//                  "Sign In as Guest!",
//                  style:signin_uptextstyle()
//                //style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

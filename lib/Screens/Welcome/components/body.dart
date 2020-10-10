import 'package:flutter/material.dart';
import 'package:techathon/Screens/Login/login_screen.dart';
import 'package:techathon/Screens/Signup/signup_screen.dart';
import 'package:techathon/Screens/Welcome/components/background.dart';
import 'package:techathon/components/rounded_button.dart';
import 'package:techathon/constants%202.dart';
import 'package:techathon/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techathon/menu.dart';
import 'package:techathon/widget.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO INHABITANT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => menu()
                ));

              },
              child: Text(
                "Sign In as Guest!",
                  style:signin_uptextstyle()
                //style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

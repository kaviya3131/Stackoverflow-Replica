import 'dart:async';

import 'package:flutter/material.dart';
import 'package:techathon/Screens/Welcome/welcome_screen.dart';
import 'package:techathon/menu.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {

    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => WelcomeScreen()
    ));

  }

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("image/splash.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),

            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SplashScreen.dart';
import 'Screens/Menu/menu.dart';

void main() => runApp(MyApp());


String _id;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _id = prefs.getString('id');


    setState(() {
      _id = prefs.getString('id');

    });
  }


  Widget fun(){
    if (_id==null){
      return SplashScreen();
    }
    else {
      return Menu();
    }
//    else if(_comp==null && _iddoc==null){
//      //return menu_patient();
//      return LoadingMenu();
//    }
//    else if(_comp==null && _idpat==null){
//      return menu_hospital();
//    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(


        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primaryColor: Color(0xff2663E2),
          scaffoldBackgroundColor: Colors.white,
          accentColor: Color(0xff6DD8D2),
          fontFamily: "OverpassRegular",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: _email == null ? SplashScreen() : menu_teacher());

        //home: SplashScreen());
        home: fun());
  }
}
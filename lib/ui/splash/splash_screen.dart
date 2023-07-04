import 'dart:async';

import 'package:fakenews2/ui/register/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => RegisterScreen()));
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/Profile.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}

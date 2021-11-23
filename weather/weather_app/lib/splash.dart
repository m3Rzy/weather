import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/_mainscreen.dart';
import 'package:weather_app/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreenPage()));
    });
    return Scaffold(
      backgroundColor: Color(0xffE2EBFF),
      body: Center(
        child: Stack(
          children: const [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 467),
                child: Text(
                  'Weather',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Gilroy-medium",
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/_mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xffE2EBFF),
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

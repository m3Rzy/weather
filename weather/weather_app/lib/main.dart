import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            )),
            child: Center(
              child: Text(
                "10°с",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Gilroy-medium",
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                ),
              ),
             ), padding: EdgeInsets.fromLTRB(0, 0, 0, 650),
          ),
          ),
        );
  }
}

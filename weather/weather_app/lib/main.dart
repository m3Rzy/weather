import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:weather_app/splash.dart';

import '_mainscreen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: const Color(0xffE2EBFF), //цвет левой менюхи
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreenPage(),
    );
  }
  
}

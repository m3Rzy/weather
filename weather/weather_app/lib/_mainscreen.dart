import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:weather_app/search.dart';
import 'package:weather_app/settings.dart';
import 'package:weather_app/weatherWidgets.dart';
import 'package:weather_app/widgets/weatherpresentation.dart';
import 'drawer_header.dart';
import 'dublicate.dart';
import 'weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  late Future<Weather> weather;
  bool flag = false;
  //Weather weatherTest = Weather(feels_like: 2.7, temp: 2.2);
  @override
  Widget build(BuildContext context) {
    print(flag);
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: const Color(0xffE2EBFF), //цвет левой менюхи
          child: SingleChildScrollView(
            child: Column(
              children: const [MyHeaderDrawer()],
            ),
          ),
        ),
      ),
      body: DublicatePage(),
    );
  }

  //https://api.weatherbit.io/v2.0/forecast/daily?postal_code=195252&key=7d214942457c4a7daae17a15d9b46f75
  //pro.openweathermap.org/data/2.5/forecast/hourly?q={city name}&appid={API key}
}

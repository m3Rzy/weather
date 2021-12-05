import 'package:flutter/material.dart';

class WeatherListWidget extends StatefulWidget {
  const WeatherListWidget({Key? key}) : super(key: key);

  @override
  State<WeatherListWidget> createState() => _WeatherListWidgetState();
}

class _WeatherListWidgetState extends State<WeatherListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffE5E5E5),
        child: Text(
          'Прогноз на неделю',
        ),
      ),
    );
  }
}

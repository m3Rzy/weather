import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';

class WeatherPresentation extends StatelessWidget {
  final WeatherForHours? weathers;
  final String time;
  final String src;
  const WeatherPresentation({
    Key? key,
    required this.weathers,
    required this.time,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 122,
      padding: const EdgeInsets.fromLTRB(0, 7, 0, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "Gilroy-medium",
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // сделать IF
          Image.asset(src, width: 40, height: 40),
          Text(
            weathers!.temp.toString() + '˚c', //weathers!.temp.toString()
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "Gilroy-medium",
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: const Color(0xffE0E9FD),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 7),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(0, -5),
          )
        ],
      ),
    );
  }

  getItem() {
    String src_new;
    switch(weathers!.desc){
        case sun:
          src_new == 
    }
  }
}

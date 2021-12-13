import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:weather_app/data/service/api.dart';
import 'package:weather_app/search.dart';
import 'package:weather_app/settings.dart';
import 'package:weather_app/weatherWidgets.dart';
import 'package:weather_app/widgets/weatherpresentation.dart';
import 'drawer_header.dart';
import 'weather.dart';
import 'dart:convert';

class DublicatePage extends StatefulWidget {
  final Weather? weather;
  const DublicatePage({Key? key, required this.weather}) : super(key: key);

  @override
  _DublicatePageState createState() => _DublicatePageState(weather: weather);
}

class _DublicatePageState extends State<DublicatePage> {
  bool flag = false;
  Weather? weather;

  _DublicatePageState({Key? key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ExpandableBottomSheet(
        //enableToggle: false,
        onIsContractedCallback: () {
          flag = false;

          setState(() {});
        },

        onIsExtendedCallback: () {
          flag = true;

          setState(() {});
        },

        persistentContentHeight: 300,
        background: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NeumorphicButton(
                          child: NeumorphicIcon(
                            Icons.menu_rounded,
                            size: 30,
                          ),
                          style: const NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.circle(),
                              lightSource: LightSource(-1, -2),
                              depth: 3,
                              intensity: 0.3,
                              color: Color(0xff0256FF)),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 39, 0, 0),
                            child: Text(
                              weather!.temp.toString().split(".")[0] +
                                  '˚c', //TYT

                              textAlign: TextAlign.center,

                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Gilroy-medium",
                                fontSize: 80,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            DateTime.now()
                                .toString()
                                .split(" ")[0]
                                .split("-")
                                .join(" "),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Gilroy-medium",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                        NeumorphicButton(
                          child: NeumorphicIcon(
                            Icons.add_circle_outline_rounded,
                            size: 30,
                          ),
                          style: const NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.circle(),
                              lightSource: LightSource(-1, -2),
                              depth: 3,
                              intensity: 0.3,
                              color: Color(0xff0256FF)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        enableToggle: true,
        persistentHeader: Container(
          height: 50,
          decoration: const BoxDecoration(
            color: Color(0xffE2EBFF),
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ), //цвет левой менюхи
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
                color: Color(0xff038CFE),
              ),
              width: 60,
              height: 3,
            ),
          ),
        ),
        expandableContent: Container(
          color: const Color(0xffE2EBFF),

          height: 500, //365
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Center(
            //header
            child: Column(
              children: [
                FutureBuilder<List<WeatherForHours?>?>(
                    future: getFilesList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WeatherPresentation(
                                  weathers: snapshot.data![0], time: "06:00"), // 0
                              WeatherPresentation(
                                  weathers: snapshot.data![1], time: "12:00"), // 1
                              WeatherPresentation(
                                  weathers: snapshot.data![2], time: "18:00"), // 2
                              WeatherPresentation(
                                  weathers: snapshot.data![3], time: "00:00"), // 3
                            ]);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                Visibility(
                  visible: flag,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              //мин. темпа
                              width: 150,
                              height: 65,
                              padding: const EdgeInsets.fromLTRB(0, 7, 0, 5),
                              child: Column(
                                // сделать отступы
                                children: [
                                  const Icon(Icons.thermostat_auto_outlined,
                                      color: Color(0xff5A5A5A), size: 24),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      weather!.feels_like
                                              .toString()
                                              .split('.')[0] +
                                          ' ˚c',
                                      style: const TextStyle(
                                        color: Color(0xff5A5A5A),
                                        fontFamily: "Gilroy-medium",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                            ),
                            Container(
                              //влажность
                              width: 150,
                              height: 65,
                              padding: const EdgeInsets.fromLTRB(0, 7, 0, 5),
                              child: Column(
                                // сделать отступы
                                children: [
                                  const Icon(Icons.pin_drop_outlined,
                                      color: Color(0xff5A5A5A), size: 24),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      weather!.humidity
                                              .toString()
                                              .split('.')[0] +
                                          '%',
                                      style: const TextStyle(
                                        color: Color(0xff5A5A5A),
                                        fontFamily: "Gilroy-medium",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              //скорость ветра

                              width: 150,
                              height: 65,
                              padding: const EdgeInsets.fromLTRB(0, 7, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.air_outlined,
                                      color: Color(0xff5A5A5A), size: 24.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      weather!.speed.toString().split(".")[0] +
                                          ' м/с',
                                      style: const TextStyle(
                                        color: Color(0xff5A5A5A),
                                        fontFamily: "Gilroy-medium",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                            ),
                            Container(
                              //влажность
                              width: 150,
                              height: 65,
                              padding: const EdgeInsets.fromLTRB(0, 7, 0, 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.speed_outlined,
                                      color: Color(0xff5A5A5A), size: 24),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      weather!.pressure
                                              .toString()
                                              .split('.')[0] +
                                          ' мм.рт.с',
                                      style: const TextStyle(
                                        color: Color(0xff5A5A5A),
                                        fontFamily: "Gilroy-medium",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  replacement: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0), //171px
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xffE2EBFF),
                        shadowColor: Colors.black,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: const Color(0xff038CFE),
                        side: const BorderSide(color: Color(0xff038CFE)),
                      ),
                      child: const Text(
                        'Прогноз на неделю',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Gilroy-medium",
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WeatherListWidget()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:weather_app/search.dart';
import 'package:weather_app/settings.dart';
import 'package:weather_app/weatherWidgets.dart';
import 'package:weather_app/widgets/weatherpresentation.dart';
import 'drawer_header.dart';
import 'weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DublicatePage extends StatefulWidget {
  const DublicatePage({Key? key}) : super(key: key);

  @override
  _DublicatePageState createState() => _DublicatePageState();
}

class _DublicatePageState extends State<DublicatePage> {
  late Future<Weather> weather;
    bool flag = false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
          child: ExpandableBottomSheet(
        //enableToggle: false,
        onIsContractedCallback: () {
         print(flag); 
            flag = false;

         setState(() {
            
          });
        },

        onIsExtendedCallback: () {
         print(flag); 

            flag = true;
         print(flag); 

          setState(() {
          });
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
                        FutureBuilder<Weather?>(
                            future: getCurrentWeather(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 39, 0, 0),
                                    child: Text(
                                      snapshot.data!.temp
                                              .toString()
                                              .split(".")[0] +
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
                                ]);
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
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
                    future: getWeatherHourly(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WeatherPresentation(
                                  weather: snapshot.data![0], time: "06:00"),
                              WeatherPresentation(
                                  weather: snapshot.data![1], time: "12:00"),
                              WeatherPresentation(
                                  weather: snapshot.data![2], time: "18:00"),
                              WeatherPresentation(
                                  weather: snapshot.data![3], time: "00:00"),
                            ]);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                Visibility(
                  visible: flag,
                  child: Padding(
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
                  replacement: Container(
                    //стереть пока, if bottomsheet == true, than btn = false & 23 сентября & Санкт-Петербург
                    width: 150,
                    height: 65,
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'time',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Gilroy-medium",
                              fontSize: 17,
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
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<Weather?> getCurrentWeather() async {
    Weather? weather;
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

    final response = await http.get(Uri.parse(url));

    print(jsonDecode(response.body));

    print("zapors");

    if (response.statusCode == 200) {
      weather = Weather.fromJSON(jsonDecode(response.body));
    } else {
      weather = null;
    }
    return weather;
  }

  Future<List<WeatherForHours?>?> getWeatherHourly() async {
    List<WeatherForHours?> weathers;

    var url = //ключ d47ca48de00b43d5926125919210512
        "https://api.weatherbit.io/v2.0/forecast/daily?postal_code=195252&key=7d214942457c4a7daae17a15d9b46f75"; //темпа на каждый день

    weathers = [];
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var weather = jsonDecode(response.body);
      for (int i = 0; i < 4; i++) {
        weathers.add(WeatherForHours.fromJSON(weather["data"][i]));
      }
      return weathers;
    } else {
      weathers = [];
    }
    return null;
  }
}

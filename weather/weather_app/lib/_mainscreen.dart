import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:weather_app/search.dart';
import 'package:weather_app/settings.dart';
import 'drawer_header.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: const Color(0xffE2EBFF), //цвет левой менюхи
          child: SingleChildScrollView(
            child: Column(
              children: [MyHeaderDrawer()],
            ),
          ),
        ),
      ),
      body: Builder(builder: (context) {
        return SafeArea(
          child: ExpandableBottomSheet(
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
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 39, 0, 0),
                                        child: Text(
                                          snapshot.data!.temp
                                              .toString()
                                              .split(".")[0], //TYT

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
                                      Text(snapshot.data!.feels_like.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Gilroy-medium",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ))
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
                                        builder: (context) =>
                                            const SearchPage()));
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

              height: 600, //360
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                //header
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 221, 0, 0), //171px
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
                        onPressed: () => print('object'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<Weather?> getCurrentWeather() async {
    Weather? weather;
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=Leningrad&units=metric&appid=bb5a4369565ef4017d0fc442e6336c37";

    final response = await http.get(Uri.parse(url));
    print("zapors");

    if (response.statusCode == 200) {
      weather = Weather.fromJSON(jsonDecode(response.body));
    } else {
      weather = null;
    }
    return weather;
  }
}

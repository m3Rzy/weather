import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/_mainscreen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ExpandableBottomSheet(
          expandableContent: Container(
            height: 0,
          ),
          background: Container(
              color: const Color(0xffE2EBFF),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
                    child: InkWell(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.keyboard_arrow_left,
                              size: 29.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                'О разработчике',
                                style: TextStyle(
                                    fontFamily: "Gilroy-medium",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreenPage()));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: SizedBox(
                      width: 255,
                      height: 52,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15)),
                            lightSource: const LightSource(0, -3.5),
                            depth: -16,
                            intensity: 0.5,
                            color: const Color(0xffE2EBFF)),
                        child: const Center(
                          child: Text('Weather app',
                              style: TextStyle(
                                  fontFamily: "Gilroy-medium",
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          persistentHeader: Container(
            decoration: BoxDecoration(
              color: const Color(0xffE2EBFF),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 28,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            height: 360,
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Center(
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 23),
                    child: Text(
                      "by ITMO University",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Gilroy-medium",
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "Версия 1.0",
                      style: TextStyle(
                        color: Color(0xff4A4A4A),
                        fontFamily: "Gilroy-medium",
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "от 30 сентября 2021",
                      style: TextStyle(
                        color: Color(0xff4A4A4A),
                        fontFamily: "Gilroy-medium",
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 250),
                    child: Text(
                      "2021",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Gilroy-medium",
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

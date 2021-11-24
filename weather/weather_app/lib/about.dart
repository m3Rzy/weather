import 'package:flutter/material.dart';
import 'package:weather_app/_mainscreen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
            SizedBox(
              ///// КАК СДЕЛАТЬ В ЦЕНТРЕ ТВОЮ МАТЬ
              width: 255,
              height: 52,
              child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                    lightSource: LightSource(0, -4),
                    depth: -16,
                    intensity: 0.5,
                    color: Color(0xffE2EBFF)),
                child: const Center(
                  child: Text('Weather app',
                      style: TextStyle(
                          fontFamily: "Gilroy-medium",
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

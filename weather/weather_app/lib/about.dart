import 'package:flutter/material.dart';
import 'package:weather_app/_mainscreen.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xffE2EBFF),
        padding: const EdgeInsets.fromLTRB(0, 0, 139, 600),
        child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        fontWeight: FontWeight.w500),
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
    );
  }
}

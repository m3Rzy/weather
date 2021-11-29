import 'package:flutter/material.dart';
import 'package:weather_app/_mainscreen.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                            'Настройки',
                            style: TextStyle(
                                fontFamily: "Gilroy-medium",
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreenPage()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

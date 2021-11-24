import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/about.dart';
import 'package:weather_app/settings.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(top: 90), //хз надо или не\
        color: const Color(0xffE2EBFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Weather app',
              style: TextStyle(
                fontFamily: "Gilroy-medium",
                fontSize: 23.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              color: const Color(0xffE2EBFF),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(42, 42, 42, 0),
                    child: InkWell(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings_outlined,
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
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()));
                      }, //кнопка сетинги
                    ),
                  ), //////////////////////////////////////////////
                  Container(
                    padding: const EdgeInsets.fromLTRB(42, 42, 42, 0),
                    child: InkWell(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.favorite_outline_outlined,
                            size: 29.0,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Избранные',
                              style: TextStyle(
                                  fontFamily: "Gilroy-medium",
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        print('object2');
                      }, //кнопка сетинги
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(42, 42, 42, 0),
                    child: InkWell(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.account_circle_outlined,
                            size: 29.0,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'О приложении',
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
                                builder: (context) => AboutPage()));
                      }, //кнопка сетинги
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

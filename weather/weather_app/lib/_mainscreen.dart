import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'drawer_header.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: const Color(0xffE2EBFF), //цвет левой менюхи
          child: SingleChildScrollView(
            child: Column(
              children: [const MyHeaderDrawer(), MyDrawerList()],
            ),
          ),
        ),
      ),
      body: Builder(builder: (context) {
        return ExpandableBottomSheet(
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
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 39, 0, 0),
                                child: Text(
                                  "10°с",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Gilroy-medium",
                                    fontSize: 80,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                "23 сент. 2021",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Gilroy-medium",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          MaterialButton(
                            onPressed: () => print('dsad'),
                            padding: EdgeInsets.all(1),
                            shape: CircleBorder(),
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: const Color(0xff0256FF),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 3),
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.15),
                                      spreadRadius: 0.1,
                                      blurRadius: 3,
                                      offset: const Offset(-1, -2),
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          persistentHeader: Container(
            decoration: const BoxDecoration(
                color: Color(0xffE2EBFF),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: 360,
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Center(
              //header
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                      color: Color(0xff038CFE),
                    ),
                    width: 60,
                    height: 3,
                  ),
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
          expandableContent: Container(
            height: 0,
          ),
        );
      }),
    );
  }
}

Widget MyDrawerList() {
  return Container(
    color: const Color(0xffE2EBFF),
    child: Column(
      children: [
        menuItem(),
      ],
    ),
  );
}

Widget menuItem() {
  return Material(
    child: Container(
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
                print('object');
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
                print('object3');
              }, //кнопка сетинги
            ),
          ),
        ],
      ),
    ),
  );
}

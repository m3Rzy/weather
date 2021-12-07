import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreenPage()));
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_left,
                              size: 29.0,
                              color: Colors.black,
                            )),
                        const Text(
                          'Настройки',
                          style: TextStyle(
                              fontFamily: "Gilroy-medium",
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 50, 240, 0),
                      child: const Text(
                        'Единицы измерения',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Gilroy-medium",
                          fontWeight: FontWeight.w600,
                          color: Color(0xff828282),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        width: 360,
                        height: 200,
                        decoration: BoxDecoration(
                          color: const Color(0xffE2EBFF),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0.3,
                              blurRadius: 25,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Температура'),
                                  // Center( // полоска снизу текста прозрачная
                                  //     child: Container(
                                  //   color: Colors.black.withOpacity(0.15),
                                  //   width: 320,
                                  //   height: 1,
                                  // )),
                                  Text('Сила ветра'),
                                  // Center(
                                  //     child: Container(
                                  //   color: Colors.black.withOpacity(0.15),
                                  //   width: 320,
                                  //   height: 1,
                                  // )),
                                  Text('Давление'),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              child: Column(children: [
                                // ошибка
                                NeumorphicToggle(
                                  height: 50,
                                  thumb: Neumorphic(),
                                  children: [
                                    ToggleElement(
                                      background: Container(
                                          color: Colors.blue,
                                          width: 50,
                                          height: 50),
                                      foreground: Container(
                                          color: Colors.red,
                                          width: 50,
                                          height: 50),
                                    ),
                                    
                                  ],
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


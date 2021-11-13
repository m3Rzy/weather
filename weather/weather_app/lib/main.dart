import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: ExpandableBottomSheet(
            background: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              )),
              child: SafeArea(
                child: Center(
                  child: Column(
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
          ),
        );
      }),
    );
  }
}

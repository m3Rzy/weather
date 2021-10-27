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
        Future.delayed(Duration.zero, () {
          showModalBottomSheet(
            enableDrag: false,
            backgroundColor: const Color(0xffE2EBFF),
            barrierColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            context: context,
            builder: (context) => Container(
              height: 256,
            ),
          );
        });
        return Scaffold(
          body: Container(
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
        );
      }),
    );
  }
}

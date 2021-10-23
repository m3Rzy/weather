import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  Main () => runApp(Main)
}

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Image.asset("assets/images/bg.png") 
          ]
        )
      )
    );
  }
}
import 'package:flutter/material.dart';

import '_mainscreen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 0, 0),
              child: Row(
                children: [
                  IconButton(onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreenPage()));},
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 29.0,
                    color: Colors.black,
                  ),),
                  Container(
                    width: 300,
                    height: 50,
                    child: const TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Введите название города',
                      ),
                    ),
                  ),
                  IconButton(onPressed: () { print('dsa');}, icon: const Icon(Icons.cancel, size: 20,) )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

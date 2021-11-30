import 'package:flutter/material.dart';
import '_mainscreen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
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
                    child: TextField(
                      controller: _controller,
                      autofocus: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: _controller.clear, icon: const Icon(Icons.cancel), color: Colors.black),
                        hintText: 'Введите название города',
                      ),
                    ),
                  ),
                  //IconButton(onPressed: () { print('dsa');}, icon: const Icon(Icons.cancel, size: 20,) )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

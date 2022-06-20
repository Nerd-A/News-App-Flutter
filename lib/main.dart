import 'package:flutter/material.dart';
import 'package:news/views/home.dart';

void main() {
  runApp(My_NEWS());
}

class My_NEWS extends StatelessWidget {
  const My_NEWS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' My News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

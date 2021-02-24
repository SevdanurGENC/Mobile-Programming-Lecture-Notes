import 'package:flutter/material.dart';
import 'package:http_demo/screens/main_screen.dart';

void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

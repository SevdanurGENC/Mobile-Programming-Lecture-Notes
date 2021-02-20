import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,

  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Sayfa 1",style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.red,backgroundColor: Colors.black))],
          ),
        ),
      ),
    );
  }
}

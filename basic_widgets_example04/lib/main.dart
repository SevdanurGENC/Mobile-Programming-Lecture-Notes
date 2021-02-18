import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int seciliIndex = 0;
  List<Widget> sayfalar = [
    Container(
      width: 150,
      height: 150,
      color: Colors.red,
    ),
    Container(
      width: 150,
      height: 150,
      color: Colors.green,
    ),
    Container(
      width: 150,
      height: 150,
      color: Colors.blue,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar Ornegi"),
        centerTitle: true,
      ),
      body: Center(child: sayfalar.elementAt(seciliIndex)
          // Container(
          //   width: 150,
          //   height: 150,
          //   color: Colors.red,
          // ),
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: "Kisi Ekle",
              activeIcon: Icon(Icons.add)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_disabled_outlined),
              label: "Kisi Engelle"),
        ],
        currentIndex: seciliIndex,
        onTap: (index) {
          setState(() {
            seciliIndex = index;
          });
        },
        showUnselectedLabels: false,
      ),
    );
  }
}

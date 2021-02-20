import 'package:flutter/material.dart';

import 'deneme01.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{

  TabController _tabController;

  List <Widget> sayfalar = [
    Tab(
      text: "Uçak Seyehati",
      icon: Icon(Icons.airplanemode_active),
    ),
    Tab(
      text: "Otobüs Seyehati",
      icon: Icon(Icons.bus_alert),
    ),
    Tab(
      text: "Araba Seyehati",
      icon: Icon(Icons.car_rental),
    ),
    Tab(
      text: "Deve Seyehati",
      icon: Icon(Icons.car_rental),
    ),
  ];

  List <Widget> sayfalar2 = [
    Image(image: NetworkImage("https://www.karsan.com/download/resources/schoolbus_01_9912558368_-1x-1_false_false.jpg")),
    Text("Deneme2"),
    MyHomePage(title: "Fatih",),
    Text("Deneme2"),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Tabbar Örneğimiz"),
        centerTitle: true,
        bottom: TabBar(

          indicatorColor: Colors.pink,
          unselectedLabelStyle: TextStyle(fontSize: 10),
          isScrollable: true,
          controller: _tabController,
          tabs: sayfalar,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: sayfalar2,
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  TabController tabController;
  List<Widget> sayfalar = [
    Tab(
      text: "Ucak Seyehati",
      icon: Icon(Icons.airplanemode_active),
    ),
    Tab(
      text: "Otobus Seyehati",
      icon: Icon(Icons.bus_alert),
    ),
    Tab(
      text: "Araba Seyehati",
      icon: Icon(Icons.car_rental),
    ),
  ];

  List<Widget> bodyTasarim = [
    Image(
      image: NetworkImage(
          "https://cdn.vox-cdn.com/thumbor/oDdR6AF3DKIp7R73RYAXdLaC68g=/0x0:1280x720/1200x800/filters:focal(538x258:742x462)/cdn.vox-cdn.com/uploads/chorus_image/image/63621787/jetblue1.0.jpg"),
    ),
    Image(
      image: NetworkImage(
          "https://www.karsan.com/Download/Images/atak-360-rev/11.jpg"),
    ),
    Image(
      image: NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjqab8PMrwySfWTx3OroFScVZKPgbE5Ayg8g&usqp=CAU"),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: sayfalar.length, vsync: this);
  }

  //DefaultTabController(
  //length: 3,
  //child:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabbar Ornegi"),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.pink,
          unselectedLabelStyle: TextStyle(fontSize: 10),
          controller: tabController,
          tabs: sayfalar,
          //[
          // Tab(
          //   text: "Ucak Seyehati",
          //   icon: Icon(Icons.airplanemode_active),
          // ),
          // Tab(
          //   text: "Otobus Seyehati",
          //   icon: Icon(Icons.bus_alert),
          // ),
          // Tab(
          //   text: "Araba Seyehati",
          //   icon: Icon(Icons.car_rental),
          // ),
          //],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: bodyTasarim,
        //sayfalar,
        //[
        // Tab(
        //   text: "Ucak Seyehati",
        //   icon: Icon(Icons.airplanemode_active),
        // ),
        // Tab(
        //   text: "Otobus Seyehati",
        //   icon: Icon(Icons.bus_alert),
        // ),
        // Tab(
        //   text: "Araba Seyehati",
        //   icon: Icon(Icons.car_rental),
        // ),
        // ],
      ),
      //),
    );
  }
}

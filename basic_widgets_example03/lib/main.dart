import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color appBarRenk = Colors.black;

  Color bodyColor = Colors.white;

  String title = "Beşiktaş";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarRenk,
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        color: bodyColor,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                appBarRenk = Colors.blue;
                bodyColor = Colors.yellow;
                title = "Fenerbahçe";
              });
            },
            child: Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/tr/archive/8/85/20161226202751%21200px-Fenerbah%C3%A7e.png",
                  scale: 10),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                appBarRenk = Colors.black;
                bodyColor = Colors.white;
                title = "Beşiktaş";
              });
            },
            child: Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/0/08/Be%C5%9Fikta%C5%9F_Logo_Be%C5%9Fikta%C5%9F_Amblem_Be%C5%9Fikta%C5%9F_Arma.png",
                  scale: 30),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                appBarRenk = Colors.red;
                bodyColor = Colors.yellow;
                title = "Galatasaray";
              });
            },
            child: Image(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/cb/96/97/cb9697aa9a80496dc76b7012ee3cce6c.png",
                  scale: 15),
            ),
          ),
        ],
      ),
    );
  }
}

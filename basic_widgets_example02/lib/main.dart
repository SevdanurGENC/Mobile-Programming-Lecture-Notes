import 'package:flutter/cupertino.dart';
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
  int sayac = 0;
  Color renk = Colors.black;
  String mesaj = "Butonun tiklanma sayisi";
  double flutterLogoSize = 30;


  void arttir() {
    setState(() {
      sayac++;
      renk = Colors.pink;
    });
  }

  void azalt() {
    setState(() {
      sayac--;
      renk = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayaç Uygulaması"),
        centerTitle: true,
        backgroundColor: renk,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mesaj,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize:20)),
            Text(
              sayac.toString(),
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.upload_sharp),
            onPressed: arttir,
          ),
          FloatingActionButton(
            child: Icon(Icons.download_rounded),
            onPressed: azalt,
          ),
          InkWell(
            child: Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/0/08/Be%C5%9Fikta%C5%9F_Logo_Be%C5%9Fikta%C5%9F_Amblem_Be%C5%9Fikta%C5%9F_Arma.png",
                  scale: flutterLogoSize),
            ),
            onTap: () {
              setState(() {
                renk = Colors.black;
                mesaj = "";
              });
            },
            onLongPress: () {
              setState(() {
                sayac = 0;
                flutterLogoSize = flutterLogoSize - 10;
              });
            },

          )
        ],
      ),
    );
  }
}

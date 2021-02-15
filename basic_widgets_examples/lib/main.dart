import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ornek Uygulamamiz",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        centerTitle: true,
        shadowColor: Colors.black, //Golge rengi
        elevation: 200, //Golge verilebilir
        actions: [
          Icon(
            Icons.more_horiz_rounded,
            size: 30,
          ),
          Icon(
            Icons.more_horiz_rounded,
            size: 30,
          ),
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.exit_to_app,
                size: 30,
              )),
        ],
        //leading: Icon(Icons.home),  //sol tarafta calisir
      ),
      //backgroundColor: Colors.greenAccent,

      drawer: Drawer(),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            //direction: Axis.horizontal,
            children: [
              Container(
                width: 150,
                height: 159,
                color: Colors.green,
              ),
              Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2012/10/29/15/36/ball-63527_960_720.jpg",
                    scale: 7),
              ),
              Container(
                width: 150,
                height: 159,
                color: Colors.pink,
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.red,
                child: Text("Tikla"),
              )
            ],
          ),
        ),
      ),

      // Container(
      //   width: 200,
      //   height: 200,
      //   color: Colors.green,
      //   child: Column(
      //     children: [
      //       Container(width: 50, height: 50, color: Colors.red,),
      //       Container(width: 50, height: 50, color: Colors.blue,),
      //       Container(width: 50, height: 50, color: Colors.yellow,)
      //     ],
      //   ),
      // ),

      floatingActionButton: FloatingActionButton(),
    );
  }
}

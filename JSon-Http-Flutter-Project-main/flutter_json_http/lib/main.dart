import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_http/local_json.dart';
import 'package:flutter_json_http/remoteapi.dart';
import 'package:http/http.dart' as http;

import 'remoteapi2.dart';

void main() => runApp(MyApp());

// class Ogrenci {
//   int id;
//   String isim;
//
//   Ogrenci(this.id, this.isim);
//
//   @override
//   String toString() {
//     return "Adi : $isim id : $id";
//   }
//
//   factory Ogrenci.mapiNesneyeDonustur(Map<String, dynamic> gelenMap) {
//     return Ogrenci(gelenMap['id'], gelenMap['isim']);
//   }
//
//   Ogrenci.fromMap(Map<String, dynamic> gelenMap)
//       : id = gelenMap['id'],
//         isim = gelenMap["isim"];
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ogrenci sevda = Ogrenci(7, "Sevdanur");
    // debugPrint(sevda.toString());
    //
    // Map<String, dynamic> sevdaMap = {'id': 15, 'isim': 'SevdanurGenc'};
    //
    // Ogrenci yeni = Ogrenci.mapiNesneyeDonustur(sevdaMap);
    // debugPrint(yeni.toString());
    //
    // Map<String, dynamic> gencMap = {'id': 17, 'isim': 'GencSevdanur'};
    // Ogrenci yeni2 = Ogrenci.fromMap(gencMap);
    // debugPrint(yeni2.toString());

    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json ve Api"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Local Json"),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LocalJsonKullanimi()));
              },
            ),
            RaisedButton(
              child: Text("Remote Api"),
              color: Colors.orangeAccent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RemoteApiKullanimi()));
              },
            ),

            RaisedButton(
              child: Text("Remote Api"),
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RemoteApi2Kullanimi()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

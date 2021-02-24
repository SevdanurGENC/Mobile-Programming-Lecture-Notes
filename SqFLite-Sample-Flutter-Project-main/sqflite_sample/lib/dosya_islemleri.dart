import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DosyaIslemleri extends StatefulWidget {
  @override
  _DosyaIslemleriState createState() => _DosyaIslemleriState();
}

class _DosyaIslemleriState extends State<DosyaIslemleri> {
  var myTextController = TextEditingController();

  //olusturulacak dosyanin klasor yolu
  Future<String> get getKlasorYolu async {
    Directory klasor = await getApplicationDocumentsDirectory();
    debugPrint("Klasor Yolu : " + klasor.path);
    return klasor.path;
  }

  //dosya olustur
  Future<File> get dosyaOlustur async {
    var olusturulacakDosyaninKlasorununYolu = await getKlasorYolu;
    return File(olusturulacakDosyaninKlasorununYolu + "/myDosya.txt");
  }

  //dosya okuma islemleri
  Future<String> dosyaOku() async {
    try {
      var myDosya = await dosyaOlustur;
      String dosyaIcerigi = await myDosya.readAsString();
      return dosyaIcerigi;
    } catch (exception) {
      return "Hata : $exception";
    }
  }

  //dosya yazma islemleri
  Future<File> dosyayaYaz(String yazilacakString) async {
    var myDosya = await dosyaOlustur;
    return myDosya.writeAsString(yazilacakString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dosya İşlemleri"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myTextController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Buraya yazılacak değerler dosyaya kaydedilir",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: _dosyaYaz,
                  color: Colors.blue,
                  child: Text("Dosyaya Yaz"),
                ),
                RaisedButton(
                  onPressed: _dosyaOku,
                  color: Colors.green,
                  child: Text("Dosyadan Oku"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _dosyaYaz() {
    dosyayaYaz(myTextController.text.toString());
  }

  void _dosyaOku() async {

    //debugPrint(await dosyaOku());
    dosyaOku().then((icerik) {
      debugPrint(icerik);
    });
  }
}

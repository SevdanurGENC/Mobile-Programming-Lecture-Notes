import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/araba.dart';

class LocalJsonKullanimi extends StatefulWidget {
  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  //List tumArabalar;
  List<Araba> tumArabalar;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("Init state calisti");
    // veriKaynagiOku().then((gelenArabalarListesi) {
    //   setState(() {
    //     tumArabalar = gelenArabalarListesi;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build calisti");
    return Scaffold(
        appBar: AppBar(
          title: Text("Local Json Kullanimi"),
        ),
        body: Container(
            child: FutureBuilder(
                future: veriKaynagiOku(),
                builder: (context, sonuc) {

                  if (sonuc.hasData){
                    tumArabalar = sonuc.data;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          // title: Text(tumArabalar[index]['araba_adi']),
                          // subtitle: Text(tumArabalar[index]['ulke'] +
                          title: Text(tumArabalar[index].arabaAdi),
                          subtitle: Text(tumArabalar[index].ulke +
                              " - " +
                              tumArabalar[index].kurulusTarihi.toString()),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image(
                              image: NetworkImage(tumArabalar[index].logo),
                            ),
                          ),
                        );
                      },
                      itemCount: tumArabalar.length,
                    );
                  }else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }



                })));
  }

  // @override
  // Widget build(BuildContext context) {
  //   debugPrint("Build calisti");
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text("Local Json Kullanimi"),
  //       ),
  //       body: tumArabalar != null
  //           ? Container(
  //               child: ListView.builder(
  //                 itemBuilder: (context, index) {
  //                   return ListTile(
  //                     title: Text(tumArabalar[index]['araba_adi']),
  //                     subtitle: Text(tumArabalar[index]['ulke'] +
  //                         " - " +
  //                         tumArabalar[index]['kurulus_tarihi'].toString()),
  //                     leading: CircleAvatar(
  //                       backgroundColor: Colors.white,
  //                       child: Image(
  //                         image: NetworkImage(tumArabalar[index]["logo"]),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //                 itemCount: tumArabalar.length,
  //               ),
  //             )
  //           : Center(
  //               child: CircularProgressIndicator(),
  //             ));
  // }

  //Future<List> veriKaynagiOku() async {
  Future<List<Araba>> veriKaynagiOku() async {
    // Future<String> jsonOku = DefaultAssetBundle.of(context).loadString(
    //     "assets/data/araba.json");
    // jsonOku.then((okunanJson) {
    //   debugPrint("Gelen Json : " + okunanJson);
    //   return okunanJson;
    // });

    var gelenJSon = await DefaultAssetBundle.of(context)
        .loadString("assets/data/araba.json");
    //debugPrint("Gelen Json : " + gelenJSon);

    //List arabaListesi = jsonDecode(gelenJSon.toString());
    // debugPrint("Araba listesi sayisi : " + arabaListesi.length.toString());
    // for (int i = 0; i < arabaListesi.length; i++) {
    //   debugPrint("Marka : " + arabaListesi[i]['araba_adi'].toString());
    //   debugPrint("Ulke : " + arabaListesi[i]['ulke'].toString());
    // }

    List<Araba> arabaListesi = (json.decode(gelenJSon) as List).map((mapYapisi)=>Araba.fromJson(mapYapisi)).toList();
    debugPrint("Araba listesi sayisi : " + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Marka : " + arabaListesi[i].arabaAdi.toString());
      debugPrint("Ulke : " + arabaListesi[i].ulke.toString());
      //debugPrint("benzinli : " + arabaListesi[i].model[i].benzinli.toString());

    }

    return arabaListesi;
  }
}

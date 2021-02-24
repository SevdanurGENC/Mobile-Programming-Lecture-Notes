import 'package:flutter/material.dart';
import 'package:sqflite_sample/dosya_islemleri.dart';
import 'package:sqflite_sample/shared_pref_kullanimi.dart';
import 'package:sqflite_sample/dosya_islemleri.dart';
import 'package:sqflite_sample/sqflite_islemleri.dart';
import 'package:sqflite_sample/utils/database_helper.dart';

import 'models/ogrenci.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //DatabaseHelper dbh1 = DatabaseHelper();


  @override
  Widget build(BuildContext context) {

    //dbh1.ogrenciEkle(Ogrenci("Sevdanur",1));
    //dbdenVerilerGetir();


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SharedPrefKullanimi(),
      //home: DosyaIslemleri(),
      home: SqfliteIslemleri(),
      debugShowCheckedModeBanner: false,
    );
  }

  // void dbdenVerilerGetir() async {
  //   var sonuc = await dbh1.tumOgrenciler();
  //   print(sonuc.toString());
  // }


}



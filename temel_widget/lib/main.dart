import 'package:flutter/material.dart';
import 'package:temel_widget/modules/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Nano Ogrenci Bilgi Sistemi";
  List<Student> students = [
    Student("Sevdanur", "Genc", 100),
    Student("Selcuk", "GENC", 40),
    Student("Liman", "AKCAY", 10)
  ];

  // var ogrenciler = [
  //   "Sevdanur GENC",
  //   "Nano GENC",
  //   "Selcuk GENC",
  //   "Liman AKCAY",
  //   "Sevdanur Nano GENC"
  // ];
  @override
  Widget build(BuildContext context) {
    //var ogrenciler = ["Sevdanur GENC", "Nano GENC", "Selcuk GENC"];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: buildBody(context),

      // Column(
      //   children: <Widget>[
      //     Expanded(
      //         child: ListView.builder(
      //             itemCount: ogrenciler.length,
      //             itemBuilder: (BuildContext context, int index) {
      //               return Text(ogrenciler[index]);
      //             })),
      //     Center(
      //         child: RaisedButton(
      //       child: Text("Sonucu Gor"),
      //       onPressed: () {
      //         // int puan = 45;
      //         // String mesaj = '';
      //         // if (puan >= 50) {
      //         //   mesaj = "Gecti";
      //         // } else if (puan >= 40) {
      //         //   mesaj = "Butunlemeye Kaldi";
      //         // } else {
      //         //   mesaj = "Kaldi";
      //         // }
      //         // var alert = AlertDialog(
      //         //   title: Text("Sinav sonucu"),
      //         //   content: Text(mesaj),
      //         // );
      //         // showDialog(
      //         //     context: context, builder: (BuildContext context) => alert);
      //
      //         var mesaj = sinavHesapla(35);
      //         mesajGoster(context, mesaj);
      //       },
      //     )),
      //   ],
      // ),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = '';
    if (puan >= 50) {
      mesaj = "Gecti";
    } else if (puan >= 40) {
      mesaj = "Butunlemeye Kaldi";
    } else {
      mesaj = "Kaldi";
    }

    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sinav sonucunuz : "),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                //itemCount: ogrenciler.length,
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  //return Text(ogrenciler[index]);
                  //return Text(students[index].firstName);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pbs.twimg.com/profile_images/3024465943/8935aa5cfc7b96c0fb13a518e310004a_400x400.jpeg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sinavdan aldigi not : " +
                        students[index].grade.toString() +
                        " [" +
                        //students[index].status +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      print(students[index].firstName +
                          " " +
                          students[index].lastName);
                    },
                    //Icon(Icons.done),
                  );
                })),
        Center(
            child: RaisedButton(
          child: Text("Sonucu Gor"),
          onPressed: () {
            // int puan = 45;
            // String mesaj = '';
            // if (puan >= 50) {
            //   mesaj = "Gecti";
            // } else if (puan >= 40) {
            //   mesaj = "Butunlemeye Kaldi";
            // } else {
            //   mesaj = "Kaldi";
            // }
            // var alert = AlertDialog(
            //   title: Text("Sinav sonucu"),
            //   content: Text(mesaj),
            // );
            // showDialog(
            //     context: context, builder: (BuildContext context) => alert);

            var mesaj = sinavHesapla(35);
            mesajGoster(context, mesaj);
          },
        )),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:temel_widget/modules/student.dart';
import 'package:temel_widget/screans/student_add.dart';
import 'package:temel_widget/screans/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  // _MyAppState createState(){
  //   return _MyAppState();
  // }
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Nano Ogrenci Bilgi Sistemi";

  //String seciliOgrenci = "";
  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Sevdanur", "Genc", 100),
    Student.withId(2, "Selcuk", "GENC", 40),
    Student.withId(3, "Liman", "AKCAY", 10)
  ];

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
      title: Text("Islem sonucunuz : "),
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
                      setState(() {
                        //print(students[index].firstName + " " + students[index].lastName);
                        print(selectedStudent.firstName +
                            " " +
                            selectedStudent.lastName);
                        //seciliOgrenci = students[index].firstName + " " + students[index].lastName;
                        selectedStudent = students[index];
                      });
                    },
                    //Icon(Icons.done),
                  );
                })),
        //Text("Secili ogrenci : " + seciliOgrenci.firstname + " " + seciliOgrenci.lastName),
        Text("Secili ogrenci : " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastName),
        Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Yeni Ogrenci"),
                    ],
                  ),
                  onPressed: () {
                    //var mesaj = "Eklendi";
                    //mesajGoster(context, mesaj);
                    Navigator.push(
                        context,
                        //MaterialPageRoute(builder: (context) => StudentAdd()));
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Row(
                    children: [
                      Icon(Icons.update),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Guncelle"),
                    ],
                  ),
                  onPressed: () {
                    //var mesaj = sinavHesapla(35);
                    //var mesaj = "Guncellendi";
                    //mesajGoster(context, mesaj);
                    Navigator.push(
                        context,
                        //MaterialPageRoute(builder: (context) => StudentAdd()));
                        MaterialPageRoute(
                            builder: (context) => StudentEdit(selectedStudent)));
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Sil"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    //var mesaj = sinavHesapla(35);
                    var mesaj = "Silindi." + selectedStudent.firstName;
                    mesajGoster(context, mesaj);
                  },
                )),
          ],
        ),

        // Center(
        //     child: RaisedButton(
        //   child: Text("Sonucu Gor"),
        //   onPressed: () {
        //     // int puan = 45;
        //     // String mesaj = '';
        //     // if (puan >= 50) {
        //     //   mesaj = "Gecti";
        //     // } else if (puan >= 40) {
        //     //   mesaj = "Butunlemeye Kaldi";
        //     // } else {
        //     //   mesaj = "Kaldi";
        //     // }
        //     // var alert = AlertDialog(
        //     //   title: Text("Sinav sonucu"),
        //     //   content: Text(mesaj),
        //     // );
        //     // showDialog(
        //     //     context: context, builder: (BuildContext context) => alert);
        //
        //     var mesaj = sinavHesapla(35);
        //     mesajGoster(context, mesaj);
        //   },
        // )),
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

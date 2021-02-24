import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "ANKET",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
        ),
        body: SurveyList(),
      ),
    );
  }
}

class SurveyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SurveyListState();
  }
}

class SurveyListState extends State {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("dilanketi").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            return buildBody(context, snapshot.data.documents);
          }
        });
  }

  Widget buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
//Widget buildBody(BuildContext context, List<Map> snapshot) {
    return ListView(
      padding: EdgeInsets.only(top: 20.0),
      children:
          snapshot.map<Widget>((data) => buildListItem(context, data)).toList(),
    );
  }

  buildListItem(BuildContext context, DocumentSnapshot data) {
    //buildListItem(BuildContext context, Map data) {
    //final row = Anket.fromMap(data);
    final row = Anket.fromSnapshot(data);
    return Padding(
      key: ValueKey(row.isim),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 3.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(
            row.isim,
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          trailing: Text(
            row.oy.toString(),
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          //onTap: () => print(row.isim),
          //onTap: () => row.reference.updateData({'oy': row.oy + 1}),
            onTap: () => Firestore.instance.runTransaction((transaction) async{
              final freshSnapshot = await transaction.get(row.reference);
              final fresh = Anket.fromSnapshot(freshSnapshot);   //Anketin kendisi
              await transaction.update(row.reference, {'oy': row.oy + 1}); //Snapshotin orjinal hali
            }),
        ),
      ),
    );
  }
}

final sahteSnapshot = [
  {'isim': 'C#', 'oy': 3},
  {'isim': 'Java', 'oy': 4},
  {'isim': 'Dart', 'oy': 5},
  {'isim': 'C++', 'oy': 7},
  {'isim': 'Python', 'oy': 90},
  {'isim': 'Perl', 'oy': 2},
];

class Anket {
  String isim;
  int oy;

  DocumentReference reference;

  Anket.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["isim"] != null),
        assert(map["oy"] != null),
        isim = map['isim'],
        oy = map['oy'];

  Anket.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

// class SurveyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance.collection('dilanketi').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting:
//             return new Text('Loading...');
//           default:
//             return new ListView(
//               children:
//                   snapshot.data.documents.map((DocumentSnapshot document) {
//                 return new ListTile(
//                   title: new Text(document['isim']),
//                   subtitle: new Text(document['oy'].toString()),
//                 );
//               }).toList(),
//             );
//         }
//       },
//     );
//   }
// }

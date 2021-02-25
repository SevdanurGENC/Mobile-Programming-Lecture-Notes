import 'package:flutter/material.dart';
import 'package:flutter_json_http/models/photos.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteApi2Kullanimi extends StatefulWidget {
  @override
  _RemoteApi2KullanimiState createState() => _RemoteApi2KullanimiState();
}

class _RemoteApi2KullanimiState extends State<RemoteApi2Kullanimi> {
  //Gonderi gonderi;

  Future<List<Photos>> _gonderiGetir() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/photos");

    if (response.statusCode == 200) {
      //http islem basarili kodu 200'dur.
      //return Gonderi.fromJsonMap(json.decode(response.body));
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Photos.fromJsonMap(tekGonderiMap))
          .toList();
    } else {
      throw Exception("Baglanti Gerceklesmedi ${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _gonderiGetir().then((okunanGonderi){
    //     gonderi= okunanGonderi;
    //     debugPrint("gelen değer : "+gonderi.title);
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api Kullanimi"),
      ),
      body: FutureBuilder(
          future: _gonderiGetir(),
          builder: (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].url),
                      leading: CircleAvatar(
                        child: Text(snapshot.data[index].id.toString()),
                      ),
                      trailing: Image(image: NetworkImage(snapshot.data[index].thumbnailUrl),),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}


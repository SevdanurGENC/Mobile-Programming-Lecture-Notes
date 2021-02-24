import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductAddState();
  }
}

class ProductAddState extends State {
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  var dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Yeni Urun Ekleme",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              buildNameField(),
              buildDescriptionField(),
              buildUnitPriceField(),
              buildSavebutton(),
            ],
          ),
        ));
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Urunun Adi : ",
      ),
      controller: txtName,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Urunun Aciklamasi : ",
      ),
      controller: txtDescription,
    );
  }

  Widget buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Urunun Fiyati : ",
      ),
      controller: txtUnitPrice,
    );
  }

  Widget buildSavebutton() {
    return FlatButton(
      child: Text(
        "Ekle",
        style: TextStyle(
            fontWeight: FontWeight.w900, fontSize: 20, color: Colors.red),
      ),
      onPressed: () {
        addProduct();
      },
    );
  }

  void addProduct() async {
    var result = await dbHelper.insert(Product(
        name: txtName.text,
        description: txtDescription.text,
        unitPrice: double.tryParse(txtUnitPrice.text)));
    Navigator.pop(context, true);
  }
}

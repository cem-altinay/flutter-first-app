import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductAddState();
  }
}

class _ProductAddState extends State {
  var dbhelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Ürün Ekle")),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            buildMainField(),
            buildDescriptionField(),
            buildUnitPriceField(),
            buidlSaveButtton()
          ],
        ),
      ),
    );
  }

  TextField buildMainField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Fiyatı"),
      controller: txtUnitPrice,
    );
  }

  buidlSaveButtton() {
    return FlatButton(
        color: Colors.indigo,
        onPressed: () {
          addProduct();
        },
        child: Icon(Icons.add));
  }

  void addProduct() async {
    var product = Product(
        txtName.text, txtDescription.text, int.tryParse(txtUnitPrice.text));

    var result = await dbhelper.insert(product);
if(result!=0) {

}
    Navigator.pop(context, true);
  }
}

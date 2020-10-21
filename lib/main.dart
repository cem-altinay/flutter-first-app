import 'package:flutter/material.dart';
import 'package:sqflite_demo/screens/ProductList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductList());
  }
}

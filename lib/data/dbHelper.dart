import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_demo/models/product.dart';

class DbHelper {
  //Field
  Database _db;

  // C# Task
  Future<Database> get db async {
    if (_db == null) {
      _db = await initilizeDb();
    }
    return _db;
  }

  Future<Database> initilizeDb() async {
    // C# Envointment = path
    String dbPath = join(await getDatabasesPath(), "etrade.db");

    return await openDatabase(dbPath, version: 1, onCreate: onCreate);
  }

  FutureOr<void> onCreate(Database db, int version) async {
    await db.execute(
        "create table products (id integer primary key, name text,decription text,unitPrice integer)");
  }

  Future<List<Product>> getProducts() async {
    Database db = await this.db;
    var result = await db.query("products");
    print("Db Res");
    print(result);
    return List.generate(result.length, (index) {
      return Product.fromObject(result[index]);
    });
  }

  Future<int> insert(Product product) async {
    Database db = await this.db;

    var result = await db.insert("products", product.toMap());

    return result;
  }

// SQL incection sebebi
  Future<int> delete(int id) async {
    Database db = await this.db;

    var result = await db.rawDelete("delete from products where id=$id");
    return result;
  }

  Future<int> delete2(int id) async {
    Database db = await this.db;

    var result = await db.delete("products", where: "id=?", whereArgs: [id]);
    return result;
  }

  Future<int> update(Product product) async {
    Database db = await this.db;

    var result = await db.update("products", product.toMap(),
        where: "id=?", whereArgs: [product.id]);
    return result;
  }
}

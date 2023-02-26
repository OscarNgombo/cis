import 'package:cis/models/customer_model.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io;

class CustomerDatabaseHelper {
  static const table = 'westMainland';
  late Database _db;

  CustomerDatabaseHelper._privateConstructor();
  static final CustomerDatabaseHelper instance =
      CustomerDatabaseHelper._privateConstructor();

  Future<Database> get database async {
    _db = await _initDB();
    return _db;
  }

  Future<Database> _initDB() async {
    //get app directory path
    var databasePath = await getDatabasesPath();

    String dbPath = path.join(databasePath, "westMainland.db");

    // Check if the database exists
    bool dbExists = await io.File(dbPath).exists();

    if (!dbExists) {
      // Copy from asset
      ByteData data =
          await rootBundle.load(path.join("assets", "westMainland.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPath).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    var db = await openDatabase(dbPath, readOnly: true);
    return db;
  }
}
//Method to get the Customer and return a customerModel

Future<CustomerModel> query(String customerController) async {
  //get a reference to the DataBase
  Database db = await CustomerDatabaseHelper.instance.database;

  var customer = customerController.toString();
  // get customer
  var results = await db.rawQuery(
      'SELECT CUSTKEY,ZONE,NAME,CUSTOMER_CATEGORY,STATUS,METER_REF  FROM westMainland WHERE CUSTKEY = $customer');
  CustomerModel customerResult = CustomerModel.fromJson(results.first);
  return customerResult;
}

//querry meter
Future<CustomerModel> queryMeter(String customerController) async {
  //get a reference to the DataBase
  Database db = await CustomerDatabaseHelper.instance.database;

  var customer = customerController.toString();
  // get customer
  var results = await db.rawQuery(
      'SELECT CUSTKEY,ZONE,NAME,CUSTOMER_CATEGORY,STATUS,METER_REF  FROM westMainland WHERE METER_REF = $customer');
  CustomerModel customerResult = CustomerModel.fromJson(results.first);
  return customerResult;
}

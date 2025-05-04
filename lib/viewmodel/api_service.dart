import 'package:classic/repository/constant.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ApiService {
  static late Db db;
  static late DbCollection dbCollection;

  static Future<void> connect() async {
    try {
      db = await Db.create(MONGO_URL);
      db.open();
      if (db.isConnected) {
        debugPrint("connect success");
      } else {
        debugPrint("connect failed");
      }
    } catch (e) {
      debugPrint("Error : $e");
    }
  }
}

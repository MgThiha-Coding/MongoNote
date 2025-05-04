import 'package:classic/model/model.dart';
import 'package:classic/repository/constant.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ApiService {
  static late Db db;
  static late DbCollection dbCollection;

  // connect
  static Future<void> connect() async {
    try {
      db = await Db.create(Repository.MONGO_URL);
      await db.open();
      if (db.isConnected) {
        debugPrint("connect success");
      } else {
        debugPrint("connect failed");
      }
      dbCollection = db.collection(Repository.userCollection);
    } catch (e) {
      debugPrint("Error : $e");
    }
  }

  // create
  static Future<void> save(Model document) async {
    try {
      final res = await dbCollection.insertOne(document.toJson());
      if (res.isFailure) {
        debugPrint("An error occurs in inserting");
      }
    } catch (e) {
      debugPrint("Error $e");
    }
  }

  // read
  static Future<List<Model>> getData() async {
    try {
      final res = await dbCollection.find().toList();
      return res.map((e) => Model.fromJson(e)).toList();
    } catch (e) {
      debugPrint("Error $e");
      return [];
    }
  }

  // update
  static Future<void> update(Model document) async {
    try {
      dbCollection.update(where.id(document.id!), document.toJson());
    } catch (e) {
      debugPrint("Error $e");
    }
  }

  // delete
  static Future<bool> delete(Model document) async {
    try {
      final res = await dbCollection.deleteOne(where.id(document.id!));
      return res.isSuccess;
    } catch (e) {
      debugPrint("Error $e");
      return false;
    }
  }

  // delete all
  static Future<bool> deleteAll() async {
    try {
      final res = await dbCollection.deleteMany({});
      return res.isSuccess;
    } catch (e) {
      return false;
    }
  }
}

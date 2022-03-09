import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/core/constants/my_api_constants.dart';
import 'package:task/models/users_model.dart';

//todo Get data from API
class UserService {
  static Future<List<UserModel>> getData() async {
    Response res = await Dio().get(MyApiConstants.myApi);
    return (res.data as List).map((e) => UserModel.fromJson(e)).toList();
  }

  static openBox() async {
    //todo to open box to save data in local data base
    Hive.openBox("users");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static registerAdapter() {
    Hive.registerAdapter(UserModelAdapter());
  }
}

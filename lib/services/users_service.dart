import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/core/constants/my_api_constants.dart';
import 'package:task/models/users_model.dart';

//todo Get data from API
class UserService {
  static Box? usersBox;
  static late List<UserModel> onlineData;

  static Future<List<UserModel>> getData() async {
    await openBox();
    Response res = await Dio().get(MyApiConstants.myApi);
    List<UserModel> allData =
        (res.data as List).map((e) => UserModel.fromJson(e)).toList();
    onlineData = allData;

    try {
      putData(allData);
    } catch (e) {
      Exception(e);
    }

    return allData;
  }

  static openBox() async {
    //todo open box to save data in local data base
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    usersBox = await Hive.openBox("users");
  }

  static putData(List<UserModel> data) async {
    await usersBox!.clear();
    //todo not add data to box again
    for (var item in data) {
      usersBox!.add(item);
    }
  }

  static registerAdapter() {
    //todo register Adapters
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }
}

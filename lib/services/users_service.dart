import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/core/constants/my_api_constants.dart';
import 'package:task/models/users_model.dart';

//todo Get data from API
//todo call some functions depend on backend side
class UserService {
  Box<UserModel>? usersBox;

  static Future<List<UserModel>> getData() async {
    await openBox();
    Response res = await Dio().get(MyApiConstants.myApi);
    List<UserModel>? allData =
        (res.data as List).map((e) => UserModel.fromJson(e)).toList();
    await putData(allData);
    return allData;
  }

  static openBox() async {
    //todo open box to save data in local data base
    Hive.openBox("users");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(List<UserModel> data) async {
    for (var item in data) {
      print(item.id);
    }
  }

  static registerAdapter() {
    //todo register
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }
}

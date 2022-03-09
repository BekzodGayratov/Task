import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/models/users_model.dart';
import 'package:task/services/users_service.dart';
import 'package:task/widgets/list_of_user_in_box.dart';
import 'package:task/widgets/list_of_users_widgets.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  bool isConnected = false;
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return isConnected
        ? FutureBuilder(
            future: UserService.getData(),
            builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              } else {
                return FadeInUp(child: ListOfUsers(snap: snapshot,isConnect: isConnected,));
              }
            },
          )
        : const ListOfUsersInBox();
  }

  checkConnection() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        isConnected = true;
        Fluttertoast.showToast(msg: "You are online");
        setState(() {});
      } else {
        isConnected = false;
        Fluttertoast.showToast(msg: "You are offline");
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription!.cancel();
    super.dispose();
  }
}

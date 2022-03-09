import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:task/models/users_model.dart';
import 'package:task/services/users_service.dart';
import 'package:task/widgets/list_of_users_widgets.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final Connectivity _connectivity = Connectivity();
  bool? isConnected;
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: UserService.getData,
      child: FutureBuilder(
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
            return ListOfUsers(snap: snapshot);
          }
        },
      ),
    );
  }

  checkConnection() async {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        isConnected == true;
        setState(() {});
      } else {
        isConnected == false;
        setState(() {
          
        });
      }
    });
  }
}

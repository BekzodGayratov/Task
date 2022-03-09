import 'package:flutter/material.dart';
import 'package:task/models/users_model.dart';
import 'package:task/services/users_service.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({Key? key}) : super(key: key);

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
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height *0.01),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 25.0,
                                backgroundImage: NetworkImage(
                                    "https://source.unsplash.com/random/$__")),
                            title: Text(snapshot.data![__].username.toString()),
                            subtitle: Text(snapshot.data![__].email.toString()),
                            trailing: Text(snapshot.data![__].id.toString()),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

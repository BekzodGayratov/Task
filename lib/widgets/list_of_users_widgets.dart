import 'package:flutter/material.dart';
import 'package:task/models/users_model.dart';
import 'package:task/services/users_service.dart';

class ListOfUsers extends StatelessWidget {
  final AsyncSnapshot<List<UserModel>>? snap;
  final bool isConnect;
  const ListOfUsers({Key? key, required this.snap, required this.isConnect})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: UserService.getData,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, __) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Card(
                    child: InkWell(
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                                "https://source.unsplash.com/random/$__")),
                        title: Text(snap!.data![__].username!.toString()),
                        subtitle: Text(snap!.data![__].email.toString()),
                        trailing: Text(snap!.data![__].id.toString()),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/info', arguments: [
                          NetworkImage(
                              "https://source.unsplash.com/random/$__"),
                          snap!.data![__],
                        ]);
                      },
                    ),
                  ),
                );
              },
              itemCount: snap!.data!.length,
            ),
          )
        ],
      ),
    );
  }
}

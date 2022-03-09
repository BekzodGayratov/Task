import 'package:flutter/material.dart';
import 'package:task/services/users_service.dart';

class ListOfUsersInBox extends StatelessWidget {
  const ListOfUsersInBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, __) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: Card(
                  child: ListTile(
                    // leading: CircleAvatar(
                    //     radius: 25.0,
                    //     backgroundImage: NetworkImage(
                    //         "https://source.unsplash.com/random")),
                    title: Text(UserService.usersBox!.getAt(__)!.username!.toString()),
                    subtitle: Text(UserService.usersBox!.getAt(__)!.email!.toString()),
                    trailing: Text(UserService.usersBox!.getAt(__)!.id!.toString()),
                  ),
                ),
              );
            },
            itemCount: UserService.usersBox!.length,
          ),
        )
      ],
    );
  }
}

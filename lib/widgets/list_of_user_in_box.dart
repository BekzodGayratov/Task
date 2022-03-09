import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task/services/users_service.dart';

class ListOfUsersInBox extends StatelessWidget {
  const ListOfUsersInBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return UserService.usersBox!.isNotEmpty
        ? FadeInLeft(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        child: Card(
                          child: InkWell(
                            child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/imagenot.gif"),
                                ),
                                title: Text(UserService.usersBox!
                                    .getAt(__)
                                    .username
                                    .toString()),
                                subtitle: Text(UserService.usersBox!
                                    .getAt(__)
                                    .email
                                    .toString()),
                                trailing: Text(UserService.usersBox!
                                    .getAt(__)
                                    .id
                                    .toString())),
                            onTap: () {
                              Navigator.pushNamed(context, "/info", arguments: [
                                const AssetImage("assets/imagenot.gif"),
                                UserService.usersBox!.getAt(__)
                              ]);
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: UserService.usersBox!.length,
                  ),
                )
              ],
            ),
          )
        : const Center(
            child: Text("Please check your connection"),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:task/models/users_model.dart';

class ListOfUsers extends StatelessWidget {
  AsyncSnapshot<List<UserModel>>? snap;
  ListOfUsers({Key? key,required this.snap}) : super(key: key);
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
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                            "https://source.unsplash.com/random/$__")),
                    title: Text(snap!.data![__].username!.toString()),
                    subtitle: Text(snap!.data![__].email.toString()),
                    trailing: Text(snap!.data![__].id.toString()),
                  ),
                ),
              );
            },
            itemCount: snap!.data!.length,
          ),
        )
      ],
    );
  }
}

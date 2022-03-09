import 'package:flutter/material.dart';

class InfoLines extends StatelessWidget {
  final String prefixInfo;
  final String suffixInfo;
  const InfoLines(
      {Key? key, required this.prefixInfo, required this.suffixInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01),
        child: Card(
          child: ListTile(
            leading: Text(
              prefixInfo,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            trailing: InkWell(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Text(suffixInfo,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w700),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Center(
                              child: Text(
                            suffixInfo,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )));
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/search_page_provider.dart';
import 'package:task/widgets/info_page_line_info_widget.dart';

class InfoPage extends StatelessWidget {
  final List data;
  const InfoPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>SearchPageProvider(),builder: (context,child){
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FadeInLeft(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: data[0])),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    children: [
                      InfoLines(
                          prefixInfo: "Name:", suffixInfo: data[1].name.toString()),
                      InfoLines(
                          prefixInfo: "Username:",
                          suffixInfo: data[1].username.toString()),
                      InfoLines(
                          prefixInfo: "Phone number",
                          suffixInfo: data[1].phone.toString()),
                      InfoLines(
                          prefixInfo: "Email:",
                          suffixInfo: data[1].email.toString()),
                      InfoLines(
                          prefixInfo: "Address:",
                          suffixInfo: data[1].address.city.toString()),
                       InfoLines(
                          prefixInfo: "Web site:",
                          suffixInfo: data[1].website.toString()),
                        InfoLines(
                          prefixInfo: "Company:",
                          suffixInfo: data[1].company.name.toString())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    },);
  }
}


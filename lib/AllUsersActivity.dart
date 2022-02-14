import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/Models/AllUserModel.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AllUsersActivity extends StatefulWidget {
  String value;
  AllUsersActivity({this.value});
  @override
  _AllUsersActivityState createState() => _AllUsersActivityState(value);
}

class _AllUsersActivityState extends State<AllUsersActivity> {
  SharedPreferences prefs;
  var token;
  AllUserModel allUserModel = AllUserModel();
  List message = [];
  String value;
  _AllUsersActivityState(this.value);

  Future<Null> getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    loadData();
  }

  @override
  void initState() {
    // TODO: implement initState
    getSharedPrefs();
  }

  loadData() async {
    var response = await http.get(
        Uri.parse("https://majlis.virtuebyte.in/api/admin/users"),
        headers: ({
          'Authorization': 'Bearer ${token}',
        }));

    var jsonBody = json.decode(response.body);

    setState(() {
      allUserModel = AllUserModel.fromJson(jsonBody);
    });

    message = jsonBody["payload"];

    message.forEach((element) {
      Map obj = element;
      String first_name = obj['first_name'];
      print(first_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
      ),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index) {
          if (index >= message?.length ?? 0) return null;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 200,
                      color: Color(0xFFF8F2EE),
                      child: Center(
                        child: Image(
                          height: 175,
                          width: 175,
                          image: AssetImage('assets/man.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${message[index]['phone_number']} || ${message[index]['country']} ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.teal.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "${message[index]['first_name']}",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 15, right: 15, bottom: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "${message[index]['occupation']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

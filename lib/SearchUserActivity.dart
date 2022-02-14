import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchUserActivity extends StatefulWidget {
  @override
  _SearchUserActivityState createState() => _SearchUserActivityState();
}

class _SearchUserActivityState extends State<SearchUserActivity> {
  SharedPreferences prefs;
  var token;
  var userController = TextEditingController();
  var value = "User data will be shown here";
  var name = "E.g John Wick";
  var occupation = "E.g Engineer";
  List message = [];

  Future<Null> getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  @override
  void initState() {
    // TODO: implement initState
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search User"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                          labelText: "Enter User Name Here",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.password_rounded)),
                    ),
                  ),
                  RaisedButton(
                      textColor: Colors.white,
                      child: Text("Search"),
                      color: Colors.purple.shade400,
                      onPressed: () async {
                        searchUserMethod();
                      }),
                ],
              ),
            ),
            Padding(
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
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            name,
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
                            occupation,
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
            ),
          ],
        ),
      ),
    );
  }

  Future<void> searchUserMethod() async {
    if (userController.text.isNotEmpty) {
      ///////////////////////////////////////////////////////////////////

      //var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var response = await http.get(
          Uri.parse(
              "https://majlis.virtuebyte.in/api/admin/search/${userController.text}"),
          headers: ({
            'Authorization': 'Bearer ${token}',
          }));
      var R = json.decode(response.body);

      print("R Data ${R.toString()}");

      setState(() {});

      message = R["payload"];

      message.forEach((element) {
        Map obj = element;
        String first_name = obj['first_name'];
        String last_name = obj['last_name'];
        name = first_name + " " + last_name;
        occupation = obj['occupation'];
      });

      if (response.statusCode == 200) {
        value = R.toString();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Success")));
      } else {
        print(response.reasonPhrase);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Fields not allowed")));
    }
  }
}

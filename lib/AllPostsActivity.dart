import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AllPostActivity extends StatefulWidget {
  @override
  _AllPostActivityState createState() => _AllPostActivityState();
}

class _AllPostActivityState extends State<AllPostActivity> {
  List message = [];
  var id = "";
  SharedPreferences prefs;
  var token;

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
        Uri.parse("https://majlis.virtuebyte.in/api/admin/posts"),
        headers: ({
          'Authorization': 'Bearer ${token}',
        }));

    var jsonBody = json.decode(response.body);

    setState(() {});

    message = jsonBody["payload"];

    print(message);

    // message.forEach((element) {
    //   Map obj = element;
    //   Map user = obj['user'];
    //   String first_name = user['first_name'];
    //   print(first_name);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("All Posts"),
      ),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index) {
          if (index >= message?.length ?? 0) return null;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          id = message[index]['_id'];
                          deletePostMethod();
                        });
                      },
                      child: Image(
                        height: 50,
                        width: 50,
                        image: AssetImage('assets/delete.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 15, right: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "${message[index]['user']['first_name']}  ${message[index]['user']['last_name']} ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    "Hello my name is ${message[index]['user']['first_name']} this is post content",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
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
        }),
      ),
    );
  }

  Future<void> deletePostMethod() async {
    if (id.isNotEmpty) {
      ///////////////////////////////////////////////////////////////////

      //var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var response = await http.delete(
          Uri.parse(
              "https://majlis.virtuebyte.in/api/admin/posts/delete/${id}"),
          headers: ({
            'Authorization': 'Bearer ${token}',
          }));

      var R = json.decode(response.body);

      print("Delete Data ${R.toString()}");

      //String message = R["status"]["message"];

      if (response.statusCode == 200) {
        setState(() {
          loadData();
        });
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

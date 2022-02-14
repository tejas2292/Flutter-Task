import 'package:flutter/material.dart';
import 'package:flutter_app/AllPostsActivity.dart';
import 'package:flutter_app/AllUsersActivity.dart';
import 'package:flutter_app/ChangePasswordActivity.dart';
import 'package:flutter_app/LoginActivity.dart';
import 'package:flutter_app/SearchUserActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  SharedPreferences prefs;
  String value = "admin";
  //_HomeActivityState(this.value);

  Future<Null> getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    value = prefs.getString('user_name');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  value,
                  //value,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8.0),
                        child: ButtonTheme(
                          minWidth: 150,
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.purple.shade400,
                              child: Text("All Users"),
                              onPressed: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllUsersActivity()));
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ButtonTheme(
                          minWidth: 150,
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.purple.shade400,
                              child: Text("Search Users"),
                              onPressed: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchUserActivity()));
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ButtonTheme(
                          minWidth: 150,
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.purple.shade400,
                              child: Text("All Posts"),
                              onPressed: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllPostActivity()));
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ButtonTheme(
                          minWidth: 150,
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.purple.shade400,
                              child: Text("Change Password"),
                              onPressed: () {
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChangePasswordActivity()));
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ButtonTheme(
                          minWidth: 150,
                          child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.purple.shade400,
                              child: Text("Logout"),
                              onPressed: () async {
                                prefs = await SharedPreferences.getInstance();
                                prefs.remove('user_id');
                                prefs.remove('user_name');
                                prefs.remove('token');
                                prefs.remove('email');
                                Navigator.push(
                                    (context),
                                    MaterialPageRoute(
                                        builder: (context) => login()));
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/HomeActivity.dart';
import 'package:flutter_app/LoginActivity.dart';
import 'package:flutter_app/AllUsersActivity.dart';
import 'package:flutter_app/Models/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(MaterialApp(home: email == null ? login() : HomeActivity()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Login",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

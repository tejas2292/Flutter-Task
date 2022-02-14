import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/HomeActivity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'AllUsersActivity.dart';
import 'Models/LoginModel.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  LoginModel loginModel = LoginModel();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.lock)),
              ),
              SizedBox(
                height: 45,
              ),
              OutlineButton.icon(
                  onPressed: () async {
                    login();
                  },
                  icon: Icon(Icons.login),
                  label: Text("Login")),
            ],
          ),
        )),
      ),
    );
  }

  //Create fun to call login post api

  Future<void> login() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      ///////////////////////////////////////////////////////////////////

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };
      var request = http.Request(
          'POST', Uri.parse('https://majlis.virtuebyte.in/api/auth/admin'));
      request.body =
          json.encode({"email": "admin@gmail.com", "password": 1234});
      request.headers.addAll(headers);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      var R = json.decode(response.body);
      setState(() {
        loginModel = LoginModel.fromJson(R);
      });

      if (response.statusCode == 200) {
        print("in side response");
        if (loginModel.status.message == "SUCCESS") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('user_id', loginModel.payload.user.id);
          prefs.setString('user_name', loginModel.payload.user.name);
          prefs.setString('token', loginModel.payload.token);
          prefs.setString('email', emailController.text);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeActivity()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Credentials.")));
        }
      } else {
        print(response.reasonPhrase);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Fields not allowed")));
    }
  }
}

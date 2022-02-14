import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginActivity.dart';
import 'Models/LoginModel.dart';

class ChangePasswordActivity extends StatefulWidget {
  @override
  _ChangePasswordActivityState createState() => _ChangePasswordActivityState();
}

class _ChangePasswordActivityState extends State<ChangePasswordActivity> {
  // LoginModel loginModel = LoginModel();
  var passwordController = TextEditingController();
  SharedPreferences prefs;
  var token;
  var id;

  Future<Null> getSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    id = prefs.getString('user_id');
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
        title: Text("Change Password"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Enter New Password",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.password_rounded)),
                ),
              ),
              RaisedButton(
                  textColor: Colors.white,
                  child: Text("Submit"),
                  color: Colors.purple.shade400,
                  onPressed: () async {
                    changePasswordMethod();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> changePasswordMethod() async {
    if (passwordController.text.isNotEmpty) {
      ///////////////////////////////////////////////////////////////////

      //var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var response = await http.put(
          Uri.parse(
              "https://majlis.virtuebyte.in/api/admin/chnagePassword/${id}"),
          headers: ({
            'Authorization': 'Bearer ${token}',
          }),
          body: ({'password': passwordController.text}));

      var R = json.decode(response.body);

      print("R Data ${R.toString()}");

      setState(() {});

      //String message = R["status"]["message"];

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Success")));
        prefs.remove('user_id');
        prefs.remove('user_name');
        prefs.remove('token');
        prefs.remove('email');
        Navigator.push(
            (context), MaterialPageRoute(builder: (context) => login()));
      } else {
        print(response.reasonPhrase);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Fields not allowed")));
    }
  }
}

import 'package:chat_app/classes/firebase_account.dart';
import 'package:chat_app/interfaces/account.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  final Account _account = FirebaseAccount();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text(
              "Log out",
            ),
            onPressed: () {
              _account.logOut(context);
            },
          ),
        ));
  }
}

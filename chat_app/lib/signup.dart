import 'package:flutter/material.dart';
import './services/auth.dart';

class SignUp extends StatelessWidget {
  AuthMethods authMethods = new AuthMethods();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Please enter an email',
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: 'Please enter a password',
                  ),
                  obscureText: true,
                  onChanged: (val) {
                    password = val;
                  }),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  authMethods.signUpwithEmailAndPassword(email, password);
                  // Navigate back to first route when tapped.
                },
                child: Text('Create user'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

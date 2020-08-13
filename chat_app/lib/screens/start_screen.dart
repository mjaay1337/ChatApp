import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/sign_up_screen.dart';

class StartScreen extends StatelessWidget {
  static const String id = 'start';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            child: Text('Already have a login? Login!'),
          ),
          RaisedButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, SignUpScreen.id);
            },
            child: Text(
              'Don\'t have a login? Sign up!',
            ),
          ),
        ],
      ),
    );
  }
}

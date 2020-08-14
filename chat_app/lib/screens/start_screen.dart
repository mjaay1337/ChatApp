import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/sign_up_screen.dart';

class StartScreen extends StatelessWidget {
  static const String id = 'start_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250.0,
            child: TyperAnimatedTextKit(
              speed: Duration(milliseconds: 400),
              text: [
                "Just Chat",
              ],
              textStyle: TextStyle(
                  fontSize: 32.0,
                  fontFamily: "Agne",
                  color: Colors.white,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
              alignment: AlignmentDirectional.topStart, // or Alignment.topLeft
            ),
          ),
          RaisedButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            child: Text('Login'),
          ),
          RaisedButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, SignUpScreen.id);
            },
            child: Text(
              'Sign up',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  static const String id = '/';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData && snapshot.data.providerData.length == 1) {
          return HomeScreen();
        } else {
          return StartScreen();
        }
      },
    );
  }
}

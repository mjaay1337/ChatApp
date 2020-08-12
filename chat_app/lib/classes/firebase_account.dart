import 'package:chat_app/interfaces/account.dart';

import 'package:chat_app/screens/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAccount implements Account {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String accountId;
  FirebaseAccount();
  FirebaseAccount.user(this.accountId);

  @override
  Future<AuthResult> login(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  void logOut(BuildContext context) {
    firebaseAuth.signOut().then(
        (onValue) => Navigator.pushReplacementNamed(context, LandingScreen.id));
  }

  Future<AuthResult> signUpwithEmailAndPassword(
      String email, String password) async {
    AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result;
  }
}

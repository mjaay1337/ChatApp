import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account {
  FirebaseAuth firebaseAuth;
  Future<AuthResult> login(String email, String password) {}
  Future<AuthResult> signUp(String email, String password) {}

  void logOut(BuildContext context) {}
  Future<void> resetPass(String email) {}
}

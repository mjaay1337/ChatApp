import 'package:firebase_auth/firebase_auth.dart';

import './firebase_account.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAccount _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? FirebaseAccount.user(user.uid) : null;
  }

  Future signUpwithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }
}

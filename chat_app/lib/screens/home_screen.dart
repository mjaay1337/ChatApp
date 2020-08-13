import 'package:chat_app/classes/firebase_account.dart';
import 'package:chat_app/entities/chat_screen_arguments.dart';
import 'package:chat_app/interfaces/account.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  final Account _account = FirebaseAccount();
  @override
  Widget build(BuildContext context) {
    Row _createListTile(String id, String title) {
      return Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 12), child: Icon(Icons.person_pin)),
          Expanded(
            child: FlatButton(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id,
                    arguments: ChatScreenArguments(id: id, email: title));
              },
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text("Loading...");
            default:
              return FutureBuilder(
                future: _account.firebaseAuth.currentUser(),
                builder: (context, firebaseAuthSnapshot) {
                  if (firebaseAuthSnapshot.connectionState ==
                      ConnectionState.done) {
                    FirebaseUser user = firebaseAuthSnapshot.data;
                    return ListView(
                      children: snapshot.data.documents
                          .where((element) => element['id'] != user.uid)
                          .map((DocumentSnapshot document) {
                        return _createListTile(
                            document["id"], document['email']);
                      }).toList(),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          _account.logOut(context);
        },
      ),
    );
  }
}

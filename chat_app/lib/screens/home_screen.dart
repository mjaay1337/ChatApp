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
    Row _createListTile(String uId, String sId, String title) {
      return Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 12),
              child: Icon(
                Icons.person_pin,
                size: 32,
                color: Colors.white,
              )),
          Expanded(
            child: FlatButton(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[200]),
                ),
              ),
              onPressed: () {
                Firestore.instance
                    .collection("chatrooms")
                    .where("id", whereIn: ["$uId-$sId", "$sId-$uId"])
                    .getDocuments()
                    .then((value) {
                      if (value.documents.length == 1) {
                        Navigator.pushNamed(context, ChatScreen.id,
                            arguments: ChatScreenArguments(
                                uId: uId, sId: sId, email: title));
                      } else {
                        Firestore.instance
                            .collection("chatrooms")
                            .document()
                            .setData({'id': "$uId-$sId", 'messages': []}).then(
                                (value) => Navigator.pushNamed(
                                    context, ChatScreen.id,
                                    arguments: ChatScreenArguments(
                                        uId: uId, sId: sId, email: title)));
                      }
                    });
              },
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Friends"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
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
                            user.uid, document["id"], document['email']);
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

import 'package:cloud_firestore/cloud_firestore.dart';

class UserMessage {
  String id;
  String text;

  UserMessage({this.id, this.text});

  UserMessage.fromDocument(dynamic snap)
      : this.id = snap["id"],
        this.text = snap["text"];

  Map<String, dynamic> toDocument() {
    return {"id": this.id, "text": this.text};
  }
}

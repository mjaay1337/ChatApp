import 'package:chat_app/entities/user_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String id;
  final List<UserMessage> messages;

  ChatRoom({this.id, this.messages});

  ChatRoom.fromDocument(DocumentSnapshot snap)
      : id = snap.data["id"],
        messages = snap.data["messages"].length != 0
            ? snap.data["messages"]
                .map((message) => UserMessage.fromDocument(message))
                .cast<UserMessage>()
                .toList()
            : [];

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'messages': this.messages.map((message) => message.toDocument()).toList()
    };
  }
}

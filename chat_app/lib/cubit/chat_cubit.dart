import 'package:bloc/bloc.dart';
import 'package:chat_app/entities/chatroom.dart';
import 'package:chat_app/entities/user_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatCubit extends Cubit<String> {
  void changeText(String message) => emit(message);

  Future<void> pushMessage(String documentId, String uId) {
    return Firestore.instance
        .collection("chatrooms")
        .document(documentId)
        .updateData({
      'messages': FieldValue.arrayUnion([
        {'id': uId, 'text': state}
      ])
    });
  }

  ChatCubit() : super("");
}

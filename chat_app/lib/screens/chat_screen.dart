import 'package:chat_app/cubit/chat_cubit.dart';
import 'package:chat_app/entities/chat_screen_arguments.dart';
import 'package:chat_app/entities/chatroom.dart';
import 'package:chat_app/entities/user_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  static const String id = "chat_screen";

  Widget _buildChatMessage(String text, bool isUser) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: isUser
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0, left: 8.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      child: Text(text),
    );
  }

  Widget _buildChatTextField(
      BuildContext context, String uId, String documentId) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: BlocBuilder<ChatCubit, String>(
        cubit: BlocProvider.of<ChatCubit>(context),
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                  child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message..."),
                onChanged: (value) {
                  BlocProvider.of<ChatCubit>(context).changeText(value);
                },
              )),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  BlocProvider.of<ChatCubit>(context)
                      .pushMessage(documentId, uId);
                },
              )
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ChatScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.email),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("chatrooms").where("id",
            whereIn: [
              "${args.uId}-${args.sId}",
              "${args.sId}-${args.uId}"
            ]).snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              DocumentSnapshot document = snapshot.data.documents.first;
              ChatRoom chatRoom = ChatRoom.fromDocument(document);

              List<UserMessage> messageView =
                  chatRoom.messages.reversed.toList();
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                          child: ListView.builder(
                            reverse: true,
                            padding: EdgeInsets.only(top: 15.0),
                            itemCount: chatRoom.messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              final bool isUser =
                                  messageView[index].id == args.uId
                                      ? true
                                      : false;
                              return _buildChatMessage(
                                  messageView[index].text, isUser);
                            },
                          ),
                        ),
                      ),
                    ),
                    _buildChatTextField(context, args.uId, document.documentID)
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

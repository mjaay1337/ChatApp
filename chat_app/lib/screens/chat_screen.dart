import 'package:chat_app/entities/chat_screen_arguments.dart';
import 'package:chat_app/entities/user_message.dart';
import 'package:flutter/material.dart';

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

  Widget _buildChatTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration:
                InputDecoration.collapsed(hintText: "Send a message..."),
          )),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  List<UserMessage> messages = [
    UserMessage(id: "1", text: "Hello Earl."),
    UserMessage(id: "2", text: "Hello Bob."),
    UserMessage(id: "1", text: "How are you doing?"),
    UserMessage(id: "2", text: "I am doing just fine. How about you?"),
    UserMessage(id: "1", text: "Fine too! just walked my dog and it was great"),
  ];
  @override
  Widget build(BuildContext context) {
    final ChatScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.email),
        elevation: 0.0,
      ),
      body: GestureDetector(
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
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final bool isUser =
                          messages[index].id == "1" ? true : false;
                      return _buildChatMessage(messages[index].text, isUser);
                    },
                  ),
                ),
              ),
            ),
            _buildChatTextField()
          ],
        ),
      ),
    );
  }
}

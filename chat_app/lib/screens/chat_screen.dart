import 'package:chat_app/entities/chat_screen_arguments.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String id = "chat_screen";
  @override
  Widget build(BuildContext context) {
    final ChatScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.email),
      ),
      body: Text(args.id),
    );
  }
}

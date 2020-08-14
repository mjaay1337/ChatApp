import 'package:chat_app/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextField extends StatefulWidget {
  final String documentId;
  final String uId;

  ChatTextField({this.documentId, this.uId});
  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                controller: _controller,
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
                      .pushMessage(this.widget.documentId, this.widget.uId)
                      .then((value) => _controller.clear());
                },
              )
            ],
          );
        },
      ),
    );
  }
}

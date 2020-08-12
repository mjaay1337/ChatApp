import 'package:chat_app/cubit/signup_cubit.dart';
import 'package:chat_app/signup.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: MaterialApp(
        routes: {SignUp.id: (context) => SignUp()},
        home: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Push the button to go the signup page',
              ),
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, SignUp.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

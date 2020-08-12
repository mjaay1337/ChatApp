import 'package:chat_app/cubit/register/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  static const String id = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: BlocBuilder<SignupCubit, SignupState>(
            cubit: BlocProvider.of<SignupCubit>(context),
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'Please enter an email',
                      ),
                      onChanged: (value) {
                        context.bloc<SignupCubit>().setEmail(value);
                      }),
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'Please enter a password',
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        context.bloc<SignupCubit>().setPassword(value);
                      }),
                  SizedBox(height: 15),
                  RaisedButton(
                    onPressed: () {
                      context
                          .bloc<SignupCubit>()
                          .signUp()
                          .then((value) => Navigator.pop(context));
                    },
                    child: Text("Sign up"),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

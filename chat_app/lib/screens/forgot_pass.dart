import 'package:chat_app/cubit/forgot_pass_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassScreen extends StatelessWidget {
  static const String id = 'forgot_pass';
  String email;
  var emailSent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset your password"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: BlocBuilder<ForgotPassCubit, ForgotPassState>(
            cubit: BlocProvider.of<ForgotPassCubit>(context),
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      decoration: InputDecoration(
                        hintText: 'Please enter your email',
                      ),
                      onChanged: (value) {
                        context.bloc<ForgotPassCubit>().setEmail(value);
                      }),
                  SizedBox(height: 15),
                  RaisedButton(
                    onPressed: () {
                      context.bloc<ForgotPassCubit>().resetPass();
                    },
                    child: Text('Reset password'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

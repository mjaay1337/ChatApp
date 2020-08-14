import 'package:chat_app/cubit/login_cubit.dart';
import 'package:chat_app/screens/forgot_pass.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:chat_app/screens/start_screen.dart';
import 'package:chat_app/widgets/account_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
            child: BlocBuilder<LoginCubit, LoginState>(
          cubit: BlocProvider.of<LoginCubit>(context),
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AccountTextField(
                  obscureText: false,
                  labelText: 'Email',
                  onChanged: (value) {
                    context.bloc<LoginCubit>().changeEmail(value);
                  },
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                AccountTextField(
                    obscureText: true,
                    labelText: 'Password',
                    onChanged: (value) {
                      context.bloc<LoginCubit>().changePassword(value);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, ForgotPassScreen.id),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                RaisedButton(
                  onPressed: () {
                    context.bloc<LoginCubit>().login().then((value) =>
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.id, (_) => false));
                  },
                  child: Text("Login"),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}

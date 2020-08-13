import 'package:chat_app/cubit/forgot_pass_cubit.dart';
import 'package:chat_app/cubit/login_cubit.dart';
import 'package:chat_app/cubit/signup_cubit.dart';
import 'package:chat_app/screens/forgot_pass.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/landing_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(),
        ),
        BlocProvider<ForgotPassCubit>(
          create: (context) => ForgotPassCubit(),
        )
      ],
      child: MaterialApp(
        title: 'MyChatApp',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LandingScreen.id,
        routes: {
          LandingScreen.id: (context) => LandingScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          ForgotPassScreen.id: (context) => ForgotPassScreen()
        },
      ),
    );
  }
}

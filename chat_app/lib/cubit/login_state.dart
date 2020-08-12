part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

// ignore: must_be_immutable
class LoginInitial extends LoginState {
  String email;
  String password;
  LoginInitial({this.email, this.password});
}

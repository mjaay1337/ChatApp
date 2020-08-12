part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {
  String email;
  String password;
  SignupInitial(this.email, this.password);
}

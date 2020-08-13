part of 'forgot_pass_cubit.dart';

@immutable
abstract class ForgotPassState {}

// ignore: must_be_immutable
class ForgotPassInitial extends ForgotPassState {
  String email;
  ForgotPassInitial(this.email);
}

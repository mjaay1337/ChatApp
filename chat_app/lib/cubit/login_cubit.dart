import 'package:bloc/bloc.dart';
import 'package:chat_app/classes/firebase_account.dart';
import 'package:chat_app/interfaces/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial(email: "", password: ""));
  Account account = FirebaseAccount();

  void changeEmail(String email) {
    LoginInitial loginInitial = state as LoginInitial;

    loginInitial.email = email;

    emit(loginInitial);
  }

  void changePassword(String password) {
    LoginInitial loginInitial = state as LoginInitial;

    loginInitial.password = password;

    emit(loginInitial);
  }

  Future<AuthResult> login() {
    LoginInitial loginInitial = state as LoginInitial;

    return account.login(loginInitial.email, loginInitial.password);
  }
}

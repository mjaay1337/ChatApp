import 'package:bloc/bloc.dart';
import 'package:chat_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  AuthMethods authMethods = new AuthMethods();
  SignupCubit() : super(SignupInitial("", ""));

  void setEmail(String email) {
    SignupInitial signupInitial = state as SignupState;
    signupInitial.email = email;
    emit(signupInitial);
  }

  void setPassword(String password) {
    SignupInitial signupInitial = state as SignupState;
    signupInitial.password = password;
    emit(signupInitial);
  }

  Future<AuthResult> signUp() {
    SignupInitial signupInitial = state as SignupState;
    return authMethods.signUpwithEmailAndPassword(
        signupInitial.email, signupInitial.password);
  }
}

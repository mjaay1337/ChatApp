import 'package:bloc/bloc.dart';
import 'package:chat_app/classes/firebase_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  FirebaseAccount authMethods = new FirebaseAccount();
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

  Future<AuthResult> signUp() async {
    SignupInitial signupInitial = state as SignupState;
    return await authMethods.signUpwithEmailAndPassword(
        signupInitial.email, signupInitial.password);
  }
}

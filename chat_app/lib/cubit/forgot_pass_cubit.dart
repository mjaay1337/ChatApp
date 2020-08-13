import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import '../classes/firebase_account.dart';

import '../interfaces/account.dart';

part 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  ForgotPassCubit() : super(ForgotPassInitial(''));
  Account account = FirebaseAccount();

  void setEmail(String email) {
    ForgotPassInitial forgotPassInitial = state as ForgotPassState;
    forgotPassInitial.email = email;
    emit(forgotPassInitial);
  }

  Future<void> resetPass() {
    ForgotPassInitial forgotPassInitial = state as ForgotPassState;
    return account.resetPass(forgotPassInitial.email);
  }
}

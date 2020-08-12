import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chat_app/cubit/signup_cubit.dart';
import 'package:mockito/mockito.dart';

class MocksignupCubit extends Mock implements SignupCubit {}

class MockAuth extends Mock implements AuthResult {}

void main() {
  test('Test initial state - Email', () {
    final cube = SignupCubit();
    final state = cube.state as SignupInitial;

    expect(state.email, "");
  });

  test('Test initial state - password', () {
    final cube = SignupCubit();
    final state = cube.state as SignupInitial;

    expect(state.password, "");
  });

  test('Test function - setEmail', () {
    final cube = SignupCubit();
    final state = cube.state as SignupInitial;

    cube.setEmail("Test@mail.com");
    expect(state.email, "Test@mail.com");
  });

  test('Test function - setPassword', () {
    final cube = SignupCubit();
    final state = cube.state as SignupInitial;

    cube.setPassword("password");
    expect(state.password, "password");
  });
/*
  test('Test function - setPassword', () {
    final b = MockAuth();
    final a = MocksignupCubit();
    final cube = SignupCubit();
    final state = cube.state as SignupInitial;

    when(a.signUp()).thenAnswer((_) => Future.value(MockAuth as AuthResult));
    a.signUp();
    expect("", "");
  });
  */
}

import 'package:flutter/widgets.dart';
import 'package:test/test.dart';
import 'package:chat_app/cubit/login_cubit.dart';
import 'package:bloc_test/bloc_test.dart';

//class MockLogicCubit extends MockBloc<LoginInitial> implements LoginCubit {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    final cube = LoginCubit();
    final state = cube.state as LoginInitial;
  });

  test('Test initial account state - Email', () {
    final cube = LoginCubit();
    final state = cube.state as LoginInitial;
    expect(state.email, "");
  });

  test('Test initial account state - Password', () {
    final cube = LoginCubit();
    final state = cube.state as LoginInitial;
    expect(state.password, "");
  });

  test('Test Changed account state - Email', () {
    final cube = LoginCubit();
    final state = cube.state as LoginInitial;
    cube.changeEmail("Test@test.test");
    expect(state.email, "Test@test.test");
  });

  test('Test Changed account state - Email', () {
    final cube = LoginCubit();
    final state = cube.state as LoginInitial;
    cube.changePassword("Password");
    expect(state.password, "Password");
  });
}

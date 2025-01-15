import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_bloc_tutorial/repository/auth/login_repository.dart';
import 'package:youtube_bloc_tutorial/utils/enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>(_onLoginEmailChange);
    on<LoginPasswordChanged>(_onLoginPasswordChange);
    on<LoginSubmitButtonChanged>(_onLoginSubmitButton);
  }
  void _onLoginEmailChange(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onLoginPasswordChange(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginSubmitButton(
      LoginSubmitButtonChanged event, Emitter emit) async {
    emit(state.copyWith(postApiStatus: PostApiStatus.LOADING));

    Map<String, String> data = {
      'email': state.email,
      'password': state.password,
    };
    await loginRepository.loginApi(data).then((v) {
      //
      debugPrint("${v.error}  ${v.token}");

      if (v.error.isNotEmpty) {
        debugPrint('failedd');

        emit(state.copyWith(
            postApiStatus: PostApiStatus.ERROR, message: v.error.toString()));
      } else {
        debugPrint('complete');

        emit(state.copyWith(
            postApiStatus: PostApiStatus.SUCCESS,
            message: "Login successFull"));
      }
    }).onError(
      (error, stackTrace) {
        debugPrint('error $error');

        emit(state.copyWith(
            message: error.toString(), postApiStatus: PostApiStatus.ERROR));
      },
    );
  }
}

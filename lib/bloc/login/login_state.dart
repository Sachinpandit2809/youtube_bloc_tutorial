part of 'login_bloc.dart';

@freezed
class LoginState extends Equatable {
  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String message;
  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.postApiStatus = PostApiStatus.INITIAL,
  });
  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      PostApiStatus? postApiStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [email, password, message, postApiStatus];
}

part of 'login_bloc.dart';

@freezed
class LoginState extends Equatable {
  final String email;
  final String password;
  const LoginState(
      {this.email = '',
      this.password = '',
      // this.emailFocus = false,
      // this.passwordFocus = false
      });
      LoginState copyWith({
        String? email,
        String? password,
        // bool? emailFocus,
        // bool? passwordFocus
      }) {
        return LoginState(
          email: email ?? this.email,
          password: password ?? this.password,
          // emailFocus: emailFocus ?? this.emailFocus,
          // passwordFocus: passwordFocus ?? this.passwordFocus
        );
      }
  @override
  List<Object?> get props => [ email, password];
}

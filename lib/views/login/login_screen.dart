import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_tutorial/bloc/login/login_bloc.dart';
import 'package:youtube_bloc_tutorial/views/login/widgets/email_input_widget.dart';
import 'package:youtube_bloc_tutorial/views/login/widgets/login_button_widget.dart';
import 'package:youtube_bloc_tutorial/views/login/widgets/password_input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                EmailInputWidget(emailFocusNode: emailFocusNode),
                const SizedBox(
                  height: 30,
                ),
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(
                  height: 30,
                ),
                LoginButtonWidget(formKey: formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

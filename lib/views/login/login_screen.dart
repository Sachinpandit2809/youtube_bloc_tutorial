import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/views/login/widgets/email_input_widget.dart';
import 'package:youtube_bloc_tutorial/views/login/widgets/login_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              EmailInputWidget(emailFocusNode: emailFocusNode),
              const SizedBox(
                height: 30,
              ),
              EmailInputWidget(emailFocusNode: emailFocusNode),
              const SizedBox(
                height: 30,
              ),
              LoginButtonWidget(formKey: formKey),
            ],
          ),
        ),
      ),
    );
  }
}

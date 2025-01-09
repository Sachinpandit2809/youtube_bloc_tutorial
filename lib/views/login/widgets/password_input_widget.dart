import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_tutorial/bloc/login/login_bloc.dart';

// ignore: must_be_immutable
class PasswordInputWidget extends StatelessWidget {
  FocusNode passwordFocusNode;
  PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        debugPrint(state.password);

        return TextFormField(
          obscureText: true,
          focusNode: passwordFocusNode,
          onFieldSubmitted: (_) {
            // passwordFocusNode.unfocus();
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
          onChanged: (pass) {
            context.read<LoginBloc>().add(LoginPasswordChanged(password: pass));
          },
        );
      },
    );
  }
}

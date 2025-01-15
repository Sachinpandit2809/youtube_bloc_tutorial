import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_tutorial/bloc/login/login_bloc.dart';
import 'package:youtube_bloc_tutorial/utils/validation.dart';

// ignore: must_be_immutable
class EmailInputWidget extends StatelessWidget {
  FocusNode emailFocusNode;
  EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        debugPrint(state.email);
        return TextFormField(
          focusNode: emailFocusNode,
          onFieldSubmitted: (_) {},
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
            hintText: 'Enter your email',
          ),
          onChanged: (email) {
            context.read<LoginBloc>().add(LoginEmailChanged(email: email));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            } else if (!Validation.validateEmail(value)) {
              return 'Please enter a valid email';
            }
            return null;
            
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailInputWidget extends StatelessWidget {
  FocusNode emailFocusNode;
  EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: emailFocusNode,
      onFieldSubmitted: (_) {},
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'Enter your email',
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }
}

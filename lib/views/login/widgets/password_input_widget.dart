import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordInputWidget extends StatelessWidget {
  FocusNode passwordFocusNode;
   PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
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
                onChanged: (value) {},
              );
  }
}
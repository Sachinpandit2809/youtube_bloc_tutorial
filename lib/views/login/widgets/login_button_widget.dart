import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_tutorial/bloc/login/login_bloc.dart';
import 'package:youtube_bloc_tutorial/config/components/round_button.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatelessWidget {
  GlobalKey<FormState> formKey;
  LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return RoundButton(
          title: 'Login',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Do something
              debugPrint("btn clicked");
            }
          },
        );
      },
    );
  }
}

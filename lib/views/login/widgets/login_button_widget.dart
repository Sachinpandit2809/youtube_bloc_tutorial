import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_tutorial/bloc/login/login_bloc.dart';
import 'package:youtube_bloc_tutorial/config/components/loading_widget.dart';
import 'package:youtube_bloc_tutorial/config/components/round_button.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';
import 'package:youtube_bloc_tutorial/utils/enum.dart';
import 'package:youtube_bloc_tutorial/utils/flush_bar_helper.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatelessWidget {
  GlobalKey<FormState> formKey;
  LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.ERROR) {
          FlushBarHelper.flushErrorMessage("${state.message}", context);
        }
        if (state.postApiStatus == PostApiStatus.SUCCESS) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
          FlushBarHelper.flushSuccessMessage("Login SuccessFull", context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return state.postApiStatus == PostApiStatus.LOADING
              ? const LoadingWidget()
              : RoundButton(
                  title: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Do something
                      debugPrint("btn clicked");
                      context.read<LoginBloc>().add(LoginSubmitButtonChanged());
                    }
                  },
                );
        },
      ),
    );
  }
}

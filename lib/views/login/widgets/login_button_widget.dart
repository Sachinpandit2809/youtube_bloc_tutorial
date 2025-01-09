import 'package:flutter/cupertino.dart';
import 'package:youtube_bloc_tutorial/config/components/round_button.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatelessWidget {
   GlobalKey<FormState> formKey;
   LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return  RoundButton(
                title: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Do something
                    debugPrint("btn clicked");
                  }
                },
              );
  }
}
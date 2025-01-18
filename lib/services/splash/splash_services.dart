import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';
import 'package:youtube_bloc_tutorial/services/session_manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreferences().then((value) {
      if (SessionController().isLoggedIn == true ?? false) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.homeScreen, (route) => false));
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));
      }
    }).onError(
      (error, stackTrace) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.loginScreen, (route) => false));

        debugPrint(error.toString());
      },
    );
  }
}

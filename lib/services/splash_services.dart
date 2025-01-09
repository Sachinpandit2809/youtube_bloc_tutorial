import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';

class SplashServices {
  void isLogin(BuildContext context){

    Timer(const Duration(seconds: 3), ()=> Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen , (route) => false));

  }
}
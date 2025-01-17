import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/model/user/user_model.dart';
import 'package:youtube_bloc_tutorial/services/storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLoggedIn;
  SessionController._internal() {
    isLoggedIn = false;
  }

  factory SessionController() {
    return _session;
  }
  // save user
  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', jsonEncode(user));
    localStorage.setValue('isLogin', 'true');
  }
//  get user

  Future<void> getUserFromPreferences() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');
      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));

      }
      SessionController().isLoggedIn = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

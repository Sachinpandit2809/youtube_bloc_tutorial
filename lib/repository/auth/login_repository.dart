import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/app_urls.dart';
import 'package:youtube_bloc_tutorial/data/network/network_api_services.dart';
import 'package:youtube_bloc_tutorial/model/user/user_model.dart';

class LoginRepository {
  final _api = NetworkApiServices();
  Future<UserModel> loginApi(dynamic data) async {
    Map<String, dynamic> demoData;
    final response = await _api.postApi(AppUrls.login, data);
    // API call
    debugPrint("Login repo" + response.toString());
    // print(response.toString() == {"token": "QpwL5tke4Pnpja7X4"}.toString());
    // if (response.toString() == {"token": "QpwL5tke4Pnpja7X4"}.toString()) {
    //   demoData = {"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9", "error": ""};
    // } else {
    //   demoData = {"token": "", "error": "user-not-found"};
    // }

    // TODO  here's i entered the demo data because the api had not returning the correct data
    demoData = {"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9", "error": null};
    return UserModel.fromJson(demoData);
  }
}

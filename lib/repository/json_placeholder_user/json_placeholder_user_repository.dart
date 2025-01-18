import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/app_urls.dart';
import 'package:youtube_bloc_tutorial/data/network/base_api_services.dart';
import 'package:youtube_bloc_tutorial/data/network/network_api_services.dart';
import 'package:youtube_bloc_tutorial/model/users_model/placeholder_user_model.dart';

class JsonPlaceholderUserRepository {
  final my_repo = NetworkApiServices();

  Future<List<PlaceholderUserModel>> fetchUserData() async {
    List<PlaceholderUserModel> userList = [];

    final response = await my_repo.getApi(AppUrls.userUrl);
    debugPrint("Repository response :- " + response.toString() + "<<<<<<<<<<R");
    for (var i in response) {
      userList.add(PlaceholderUserModel.fromJson(i));
    }
    return userList;
  }
}

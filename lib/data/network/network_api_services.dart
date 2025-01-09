import 'dart:async';
import 'dart:io';

import 'package:youtube_bloc_tutorial/data/exceptions/app_exceptions.dart';
import 'package:youtube_bloc_tutorial/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices implements BaseApiServices {

  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
      jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('');
    }
    // on Exception {
    //   throw FetchDataException("Error During Communication");
    // }
  }

  @override
  Future<dynamic> postApi(String url,var data) async {
     dynamic jsonResponse;
    try {
      final response =
          await http.post(Uri.parse(url,) , body: data).timeout(const Duration(seconds: 30));
      jsonResponse = returnResponse(response);
      return jsonResponse;
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('');
    }
  }
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200 || 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

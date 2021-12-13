import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_example/user_list/models/user_list_model.dart';
import 'package:mvvm_example/util/constants.dart';

import 'api_status.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USER_LIST_URL);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(SUCCESS, userListModelFromJson(response.body));
      }
      return Failure(INVALID_RESPONSE, 'Invalid Response');
    } on HttpException {
      return Failure(NO_INTERNET, 'No Internet');
    } on FormatException {
      return Failure(INVALID_FORMAT, 'Invalid Format');
    } catch (e) {
      return Failure(UNKNOWN_ERROR, 'Unknown Error');
    }
  }
}

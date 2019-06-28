import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:search_users/model/user.dart';
import 'package:search_users/network/user_api_response_mapper.dart';

Future<List<User>> searchUser(String username) async {
  return await http
      .get('https://api.github.com/search/users?q=$username')
      .then((response) => generateResponse(response))
      .then((data) => parseUsers(data));
}

Future<User> getDetailUser(String urlUsername) async {
  return await http
      .get(urlUsername)
      .then((response) => generateResponse(response))
      .then((data) => User.generateJson(data));
}

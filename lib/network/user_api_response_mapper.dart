import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_users/model/user.dart';

dynamic generateResponse(http.Response response) {
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return "";
  }
}

List<User> parseUsers(dynamic json) {
  var list = json["items"] as List;
  return list.map((item) => User.generateJson(item)).toList();
}

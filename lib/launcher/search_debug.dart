import 'package:flutter/material.dart';
import 'package:search_users/launcher/search_config.dart';
import 'package:search_users/launcher/search_app.dart';

void main() {
  var application = AppConfig(
    isDebug: true,
    child: SearchApp(),
  );

  runApp(application);
}

import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final bool isDebug;

  AppConfig({this.isDebug, Widget child}) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}

import 'package:flutter/material.dart';
import 'package:search_users/launcher/search_config.dart';
import 'package:search_users/screen/user_search_screen.dart';

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: config.isDebug,
      theme: ThemeData(primaryColor: Color(0xff282D32)),
      builder: (_, child) {
        return ScrollConfiguration(
          behavior: AppBehaviour(),
          child: child,
        );
      },
      home: Scaffold(
        body: SearchScreen(),
      ),
    );
  }
}

class AppBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

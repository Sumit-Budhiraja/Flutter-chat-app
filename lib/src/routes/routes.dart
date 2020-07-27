import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/chatHomePage.dart';
import '../screens/signInPage.dart';

class AppRoutes {
  static MaterialPageRoute materialPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/chatHomePage':
        return MaterialPageRoute(builder: (context) => ChatHomePagePlatform());
      case '/signInPage':
        return MaterialPageRoute(builder: (context)=>SignInPage1());
      default:
        return MaterialPageRoute(builder: (context) => SignInPage1());
    }
  }
  static CupertinoPageRoute cupertinoPageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/chatHomePage':
        return CupertinoPageRoute(builder: (context) => ChatHomePagePlatform());
      default:
        return CupertinoPageRoute(builder: (context) => SignInPage1());
    }
  }
}

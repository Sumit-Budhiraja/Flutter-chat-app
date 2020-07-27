import 'dart:io';

import '../src//routes/routes.dart';
import './screens/signInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        onGenerateRoute: AppRoutes.cupertinoPageRoute,
      );
    } else {
      return MaterialApp(
        home: SignInPage1(),
        onGenerateRoute: AppRoutes.materialPageRoute,
      );
    }
  }
}

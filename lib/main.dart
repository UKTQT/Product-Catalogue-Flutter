import 'package:flutter/material.dart';

import 'core/constants/app/app_constant.dart';
import 'core/init/navigation/navigation_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.instance!.APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}

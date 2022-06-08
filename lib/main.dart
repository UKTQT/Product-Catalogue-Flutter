import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/core/init/navigation/navigation_service.dart';
import 'package:product_catalogue_flutter/feature/auth/splash/view/splash_view.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constant.dart';
import 'core/init/navigation/navigation_route.dart';

/* void main() {
  runApp(const MyApp());
} */

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => SplashView()),
    ],
    builder: (context, child) => const MyApp(),
  ));
}

/*
  fonksiyon çalıştırma

  onPressed: (){
    context.read<viewModel>().changeTheme();

  }

  void changeTheme(){
    islighttheme = false;
    notifyListeners;
  }
*/

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
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}

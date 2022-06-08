import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/auth/splash/viewModel/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashViewModel>(
      create: (context) => SplashViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: Container(
            color: Colors.amber,
            width: 500,
            height: 100,
            child: Text('ewqewq'),
          ),
        );
      },
    );
  }
}

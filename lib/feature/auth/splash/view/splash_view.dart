import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constant.dart';
import '../viewModel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashViewModel>(
      create: (context) => SplashViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Image(
              image: AssetImage(
                AppConstant.instance!.APP_LOGO_PATH,
              ),
            ),
          ),
        );
      },
    );
  }
}

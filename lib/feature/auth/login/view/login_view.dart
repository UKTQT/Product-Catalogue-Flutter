import 'package:flutter/material.dart';

import '../../../../core/constants/app/app_constant.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                alignment: Alignment.topCenter,
                color: const Color(0xfff9bc3b),
                width: double.maxFinite,
                child: Hero(
                  tag: 'app_logo',
                  child: Image(
                    width: MediaQuery.of(context).size.width * 0.98,
                    image: AssetImage(
                      AppConstant.instance!.APP_LOGO_PATH,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.maxFinite,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Text('Hoşgeldiniz'),
                    Text('Lütfen bilgileriniz ile giriş yapınız'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

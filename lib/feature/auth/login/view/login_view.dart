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
            Container(
              alignment: Alignment.topCenter,
              color: const Color(0xfff9bc3b),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
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
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Column(
                  children: [
                    Row(children: [
                      Text('Hoşgeldiniz',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white))
                    ]),
                    Row(children: [
                      Text('Lütfen bilgileriniz ile giriş yapınız',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white))
                    ]),
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

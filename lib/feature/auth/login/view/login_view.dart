import 'package:flutter/material.dart';

import '../../../../core/constants/app/app_constant.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xfff9bc3b),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
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
          Expanded(
            flex: 5,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/core/constants/navigation/navigation_constant.dart';
import 'package:product_catalogue_flutter/feature/auth/login/viewModel/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      lazy: false,
      create: (context) => LoginViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  color: context.themeMainColor1,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,
                  child: appLogo(context),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: context.themeMainColor2,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.veryHighWidthPadding2,
                      vertical: context.mediumHeightPadding2,
                    ),
                    child:
                        SingleChildScrollView(child: loginFormItems(context)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Hero appLogo(BuildContext context) {
    return Hero(
      tag: 'app_logo',
      child: Image(
        width: MediaQuery.of(context).size.width * 0.98,
        image: AssetImage(
          AppConstant.instance!.APP_LOGO_PATH,
        ),
      ),
    );
  }

  Column loginFormItems(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppConstant.instance!.TITLE1,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: context.themeWhiteColor))
          ],
        ),
        Row(
          children: [
            Text(AppConstant.instance!.TITLE2,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: context.themeWhiteColor))
          ],
        ),
        SizedBox(height: context.mediumHeightPadding2),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-Mail boş geçilemez.';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Geçerli bir email giriniz.';
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'E-Mail',
                  labelStyle: TextStyle(color: context.themeWhite70Color),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: context.themeWhiteColor, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: context.themeWhiteColor, width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: context.mediumHeightPadding,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText:
                    context.watch<LoginViewModel>().passwordVisiblility,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre boş geçilemez.';
                  } else if (value.length < 6 || value.length > 20) {
                    return 'Şifre 6 - 20 karakter olmalıdır.';
                  } else if (value.contains(' ')) {
                    return 'Boş karakter girilemez';
                  } else if (!RegExp(r"^[a-zA-Z0-9_]*$").hasMatch(value)) {
                    //Alfanumerik RegExp
                    return 'Şifre sadece harf ve rakamlardan oluşmalıdır';
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(color: context.themeWhite70Color),
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<LoginViewModel>().passVisibilityChange();
                    },
                    icon: context.watch<LoginViewModel>().passwordVisiblility ==
                            true
                        ? Icon(
                            Icons.visibility,
                            color: context.themeWhiteColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: context.themeWhiteColor,
                          ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: context.themeWhiteColor, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: context.themeWhiteColor, width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: context.lowHeightPadding,
              ),
              CheckboxListTile(
                value: context.watch<LoginViewModel>().checkBoxValue,
                title: Text(AppConstant.instance!.REMEMBER,
                    style: TextStyle(color: context.themeWhiteColor)),
                subtitle: Text(
                  AppConstant.instance!.REMEMBER_SUB,
                  style: TextStyle(color: context.themeWhiteColor),
                ),
                onChanged: (value) {
                  context.read<LoginViewModel>().checkBoxChange(value!);
                },
                activeColor: context.themeMainColor1,
                side: BorderSide(color: context.themeWhiteColor),
              ),
              SizedBox(
                height: context.lowHeightPadding,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, NavigationConstant.REGISTER);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: context.themeWhiteColor),
                    child: Text(
                      AppConstant.instance!.REGISTER,
                      style: TextStyle(color: context.themeMainColor2),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    style: ElevatedButton.styleFrom(
                        primary: context.themeMainColor1),
                    child: Text(AppConstant.instance!.LOGIN),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

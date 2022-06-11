import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constant.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/extensions/input_extension/input_extension.dart';
import '../../../../core/extensions/padding_extension/padding_extension.dart';
import '../../../../core/extensions/color_extension/color_extension.dart';
import '../viewModel/register_view_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  //controller heyeti
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
        lazy: false,
        create: (context) => RegisterViewModel(),
        builder: (context, child) {
          return Scaffold(
              body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    //--- Logo and Bg Color
                    Container(
                        alignment: Alignment.topCenter,
                        color: context.themeMainColor1,
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height, //max height
                        child: appLogo(context)),
                    //--- Form Items
                    Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: context.themeMainColor2,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.veryHighWidthPadding2,
                                vertical: context.mediumHeightPadding2),
                            child: SingleChildScrollView(
                                child: registerFormItems(context))))
                  ])));
        });
  }

  Hero appLogo(BuildContext context) {
    return Hero(
        tag: 'app_logo',
        child: Image(
            width: MediaQuery.of(context).size.width * 0.30,
            image: AssetImage(AppConstant.instance!.APP_LOGO_PATH)));
  }

  Column registerFormItems(BuildContext context) {
    return Column(children: [
      Row(children: [
        Text(AppConstant.instance!.TITLE1,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: context.themeWhiteColor))
      ]),
      Row(children: [
        Text(AppConstant.instance!.TITLE3,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: context.themeWhiteColor))
      ]),
      SizedBox(height: context.mediumHeightPadding2),
      Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
                controller: _nameController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstant.instance!.NAME_VAL1;
                  } else if (value.contains(' ')) {
                    return AppConstant.instance!.NAME_VAL2;
                  } else if (value.length > 20 || value.length < 3) {
                    return AppConstant.instance!.NAME_VAL3;
                  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                    return AppConstant.instance!.NAME_VAL4;
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: AppConstant.instance!.NAME,
                    labelStyle: TextStyle(color: context.themeWhite70Color),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 2.0)))),
            SizedBox(height: context.mediumHeightPadding),
            TextFormField(
                controller: _surNameController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstant.instance!.SURNAME_VAL1;
                  } else if (value.contains(' ')) {
                    return AppConstant.instance!.SURNAME_VAL2;
                  } else if (value.length > 20 || value.length < 2) {
                    return AppConstant.instance!.SURNAME_VAL3;
                  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                    return AppConstant.instance!.SURNAME_VAL4;
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: AppConstant.instance!.SURNAME,
                    labelStyle: TextStyle(color: context.themeWhite70Color),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 2.0)))),
            SizedBox(height: context.mediumHeightPadding),
            TextFormField(
                controller: _phoneController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [PhoneNumberFormatter()], //(000) 000 00 00
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstant.instance!.PHONE_VAL1;
                  } else if (value.length < 15 || value.length > 15) {
                    return AppConstant.instance!.PHONE_VAL2;
                  } /* else if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                    return 'Telefon No sadece rakamlardan oluşabilir';
                  } */
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                    prefixText: AppConstant.instance!.PHONE2,
                    prefixStyle: TextStyle(color: context.themeWhiteColor),
                    isDense: true,
                    labelText: AppConstant.instance!.PHONE,
                    labelStyle: TextStyle(color: context.themeWhite70Color),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 2.0)))),
            SizedBox(height: context.mediumHeightPadding),
            TextFormField(
                controller: _emailController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstant.instance!.EMAIL_VAL;
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return AppConstant.instance!.EMAIL_VAL2;
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                    isDense: true,
                    labelText: AppConstant.instance!.EMAIL,
                    labelStyle: TextStyle(color: context.themeWhite70Color),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 2.0)))),
            SizedBox(height: context.mediumHeightPadding),
            TextFormField(
                controller: _passwordController,
                obscureText:
                    context.watch<RegisterViewModel>().passwordVisiblility,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstant.instance!.PASS_VAL1;
                  } else if (value.length < 6 || value.length > 20) {
                    return AppConstant.instance!.PASS_VAL2;
                  } else if (value.contains(' ')) {
                    return AppConstant.instance!.PASS_VAL3;
                  } else if (!RegExp(r"^[a-zA-Z0-9_]*$").hasMatch(value)) {
                    //Alfanumerik RegExp
                    return AppConstant.instance!.PASS_VAL4;
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                    labelText: AppConstant.instance!.PASS,
                    labelStyle: TextStyle(color: context.themeWhite70Color),
                    suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<RegisterViewModel>()
                              .passVisibilityChange();
                        },
                        icon: context
                                    .watch<RegisterViewModel>()
                                    .passwordVisiblility ==
                                true
                            ? Icon(Icons.visibility,
                                color: context.themeWhiteColor)
                            : Icon(Icons.visibility_off,
                                color: context.themeWhiteColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 2.0)))),
            SizedBox(height: context.mediumHeightPadding),
            TextFormField(
                controller: _passwordAgainController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText:
                    context.watch<RegisterViewModel>().passwordAgainVisiblility,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppConstant.instance!.PASS_VAL1;
                  } else if (value.isNotEmpty || value != null) {
                    if (value != _passwordController.text) {
                      return AppConstant.instance!.PASS_VAL5;
                    }
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                    labelText: AppConstant.instance!.PASS2,
                    labelStyle: TextStyle(color: context.themeWhite70Color),
                    suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<RegisterViewModel>()
                              .passAgainVisibilityChange();
                        },
                        icon: context
                                    .watch<RegisterViewModel>()
                                    .passwordAgainVisiblility ==
                                true
                            ? Icon(Icons.visibility,
                                color: context.themeWhiteColor)
                            : Icon(Icons.visibility_off,
                                color: context.themeWhiteColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: context.themeWhiteColor, width: 2.0)))),
            SizedBox(height: context.mediumHeightPadding),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, NavigationConstant.LOGIN, (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: context.themeWhiteColor),
                  child: Text(AppConstant.instance!.LOGIN,
                      style: TextStyle(color: context.themeMainColor2))),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<RegisterViewModel>()
                          .postRegisterVm(
                              name_: _nameController.text,
                              password_: _passwordController.text,
                              email_: _emailController.text)
                          .then((value) => value
                              ? context
                                  .read<RegisterViewModel>()
                                  .registerShowDialog(context: context)
                              : null);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: context.themeMainColor1),
                  child: Text(AppConstant.instance!.REGISTER))
            ])
          ]))
    ]);
  }
}

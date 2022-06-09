import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constant.dart';
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
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //--- Logo and Bg Color
                Container(
                  alignment: Alignment.topCenter,
                  color: context.themeMainColor1,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height, //max height
                  child: appLogo(context),
                ),
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
                      vertical: context.mediumHeightPadding2,
                    ),
                    child: SingleChildScrollView(
                        child: registerFormItems(context)),
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
        width: MediaQuery.of(context).size.width * 0.30,
        image: AssetImage(
          AppConstant.instance!.APP_LOGO_PATH,
        ),
      ),
    );
  }

  Column registerFormItems(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Hoşgeldiniz',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: context.themeWhiteColor))
          ],
        ),
        Row(
          children: [
            Text('Hesabınız yok mu ? Ücretsiz kaydolun',
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
                controller: _nameController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'İsim boş geçilemez.';
                  } else if (value.contains(' ')) {
                    return 'İsim boş karakter içeremez';
                  } else if (value.length > 20 || value.length < 3) {
                    return 'isim max 3 - 20 karakter arası olmalıdır';
                  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                    return 'İsim sadece harflerden oluşabilir';
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'İsim',
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
                controller: _surNameController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Soyad boş geçilemez.';
                  } else if (value.contains(' ')) {
                    return 'Soyad boş karakter içeremez';
                  } else if (value.length > 20 || value.length < 2) {
                    return 'Soyad max 20 karakter olmalıdır';
                  } else if (!RegExp(r"^[a-zA-Z0-9_]*$").hasMatch(value)) {
                    return 'Soyad sadece harf ve rakamlardan oluşabilir';
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Soyad',
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
                controller: _phoneController,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [PhoneNumberFormatter()], //(000) 000 00 00
                cursorColor: context.themeMainColor1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Telefon No boş geçilemez.';
                  } else if (value.length < 14 || value.length > 14) {
                    return 'Telefon No 10 karakter olmalıdır';
                  } else if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                    return 'Telefon No sadece rakamlardan oluşabilir';
                  }
                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                  prefixText: '+90 ',
                  prefixStyle: const TextStyle(color: Colors.white),
                  isDense: true,
                  labelText: 'Telefon No (511 222 33 44)',
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
                    context.watch<RegisterViewModel>().passwordVisiblility,
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
                      context.read<RegisterViewModel>().passVisibilityChange();
                    },
                    icon: context
                                .watch<RegisterViewModel>()
                                .passwordVisiblility ==
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
                height: context.mediumHeightPadding,
              ),
              TextFormField(
                controller: _passwordAgainController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText:
                    context.watch<RegisterViewModel>().passwordAgainVisiblility,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Şifre tekrar boş geçilemez.';
                  } else if (value.isNotEmpty || value != null) {
                    if (value != _passwordController.text) {
                      return 'Şifre ile aynı olmalıdır';
                    }
                  }

                  return null;
                },
                style: TextStyle(color: context.themeWhiteColor),
                decoration: InputDecoration(
                  labelText: 'Şifre Tekrar',
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
              /*  CheckboxListTile(
                value: context.watch<RegisterViewModel>().checkBoxValue,
                title: Text(AppConstant.instance!.REMEMBER,
                    style: TextStyle(color: context.themeWhiteColor)),
                subtitle: Text(
                  AppConstant.instance!.REMEMBER_SUB,
                  style: TextStyle(color: context.themeWhiteColor),
                ),
                onChanged: (value) {
                  context.read<RegisterViewModel>().checkBoxChange(value!);
                },
                activeColor: context.themeMainColor1,
                side: BorderSide(color: context.themeWhiteColor),
              ),
              SizedBox(
                height: context.lowHeightPadding,
              ), */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: context.themeWhiteColor),
                    child: Text(
                      AppConstant.instance!.REGISTER,
                      style: TextStyle(color: context.themeMainColor2),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(_phoneController.text.length);
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

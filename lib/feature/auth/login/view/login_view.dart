import 'package:flutter/material.dart';
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Hoşgeldiniz',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                          Row(
                            children: [
                              Text('Lütfen bilgileriniz ile giriş yapınız',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                          SizedBox(height: context.highHeightPadding2),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email boş geçilemez.';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    labelText: 'E-Mail',
                                    labelStyle:
                                        TextStyle(color: Colors.white70),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: context.mediumHeightPadding,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: context
                                      .watch<LoginViewModel>()
                                      .passwordVisiblility,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Şifre boş geçilemez.';
                                    } else if (value.length < 6 ||
                                        value.length > 20) {
                                      return 'Şifre 6 - 20 karakter olmalıdır.';
                                    } else if (value.contains(' ')) {
                                      return 'Boş karakter girilemez';
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: 'Şifre',
                                    labelStyle:
                                        TextStyle(color: Colors.white70),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        context
                                            .read<LoginViewModel>()
                                            .passVisibilityChange();
                                      },
                                      icon: context
                                                  .watch<LoginViewModel>()
                                                  .passwordVisiblility ==
                                              true
                                          ? Icon(
                                              Icons.visibility,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.visibility_off,
                                              color: Colors.white,
                                            ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: context.lowHeightPadding,
                                ),
                                CheckboxListTile(
                                  value: context
                                      .watch<LoginViewModel>()
                                      .checkBoxValue,
                                  title: const Text('Beni Hatırla',
                                      style: TextStyle(color: Colors.white)),
                                  subtitle: const Text(
                                    'Sonraki girişinizde hatırlanacaksınız.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onChanged: (value) {
                                    context
                                        .read<LoginViewModel>()
                                        .checkBoxChange(value!);
                                  },
                                  activeColor: context.themeMainColor1,
                                  side: const BorderSide(color: Colors.white),
                                ),
                                SizedBox(
                                  height: context.mediumHeightPadding,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          print('oldu');
                                        }
                                      },
                                      child: const Text('Giriş Yap'),
                                      style: ElevatedButton.styleFrom(
                                          primary: context.themeMainColor1),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';

import '../../extensions/color_extension/color_extension.dart';

Future<void> registerSuccesfull({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Kayıt işlemi başarılı.'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              const Text('Anasayfaya yönlendiriliyorsunuz.'),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child:
                      CircularProgressIndicator(color: context.themeMainColor1),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

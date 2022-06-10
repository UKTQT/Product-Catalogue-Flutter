import 'package:flutter/material.dart';

Future<void> showMyDialog({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Kayıt işlemi başarılı.'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Giriş sayfasına yönlendiriliyorsunuz.'),
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      );
    },
  );
}

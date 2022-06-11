import 'package:flutter/material.dart';

Future<void> loginFailed({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Giriş Başarısız.'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Böyle bir kullanıcı bulunamadı.'),
              Text('Tekrar deneyiniz.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ''),
            child: const Text('Anladım'),
          ),
        ],
      );
    },
  );
}

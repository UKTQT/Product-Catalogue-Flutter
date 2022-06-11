import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static final Cache _instance = Cache._init();

  SharedPreferences? preferences;
  static Cache get instance => _instance;

  Cache._init() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
    });
  }
}

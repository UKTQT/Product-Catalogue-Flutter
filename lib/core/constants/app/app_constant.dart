class AppConstant {
  static AppConstant? _instance;
  static AppConstant? get instance {
    _instance ??= AppConstant._init();
    return _instance;
  }

  AppConstant._init();

  //Main Constants
  final String APP_TITLE = 'Product Catalogue';
  final String APP_LOGO_PATH = 'assets/images/logo.jpg';
}

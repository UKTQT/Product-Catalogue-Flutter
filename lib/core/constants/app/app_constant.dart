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

  //Login View Constants
  final String TITLE1 = 'Hoşgeldiniz';
  final String TITLE2 = 'Lütfen bilgileriniz ile giriş yapınız.';
  final String EMAIL = 'E-Mail';
  final String EMAIL_VAL = 'E-Mail boş geçilemez.';
  final String PASS = 'Şifre';
  final String PASS_VAL1 = 'Şifre boş geçilemez.';
  final String PASS_VAL2 = 'Şifre 6 - 20 karakter olmalıdır.';
  final String PASS_VAL3 = 'Boş karakter girilemez';
  final String PASS_VAL4 = 'Şifre sadece harf ve rakamlardan oluşmalıdır';
  final String REMEMBER = 'Beni Hatırla';
  final String REMEMBER_SUB = 'Sonraki girişinizde hatırlanacaksınız.';
  final String REGISTER = 'Kayıt Ol';
  final String LOGIN = 'Giriş Yap';
}

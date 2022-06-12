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

  // ----- Login and Register View Constants
  final String TITLE1 = 'Hoşgeldiniz';
  final String TITLE2 = 'Lütfen bilgileriniz ile giriş yapınız.';
  final String TITLE3 = 'Hesabınız yok mu ? Ücretsiz kaydolun';

  final String NAME = 'İsim';
  final String NAME_VAL1 = 'İsim boş geçilemez.';
  final String NAME_VAL2 = 'İsim boş karakter içeremez';
  final String NAME_VAL3 = 'isim max 3 - 20 karakter arası olmalıdır';
  final String NAME_VAL4 = 'İsim sadece harflerden oluşabilir';

  final String SURNAME = 'Soyisim';
  final String SURNAME_VAL1 = 'Soyad boş geçilemez.';
  final String SURNAME_VAL2 = 'Soyad boş karakter içeremez';
  final String SURNAME_VAL3 = 'Soyad 2 - 20 karakter arası olmalıdır';
  final String SURNAME_VAL4 = 'Soyad sadece harflerden oluşabilir';

  final String PHONE = 'Telefon No (511 222 33 44)';
  final String PHONE2 = '+90 ';
  final String PHONE_VAL1 = 'Telefon No boş geçilemez.';
  final String PHONE_VAL2 = 'Telefon No 10 karakter olmalıdır';

  final String EMAIL = 'E-Mail';
  final String EMAIL_VAL = 'E-Mail boş geçilemez.';
  final String EMAIL_VAL2 = 'Geçerli bir email giriniz.';

  final String PASS = 'Şifre';
  final String PASS2 = 'Şifre Tekrar';
  final String PASS_VAL1 = 'Şifre boş geçilemez.';
  final String PASS_VAL2 = 'Şifre 6 - 20 karakter olmalıdır.';
  final String PASS_VAL3 = 'Boş karakter girilemez';
  final String PASS_VAL4 = 'Şifre sadece harf ve rakamlardan oluşmalıdır';
  final String PASS_VAL5 = 'Şifre ile aynı olmalıdır';

  final String REMEMBER = 'Beni Hatırla';
  final String REMEMBER_SUB = 'Sonraki girişinizde hatırlanacaksınız.';
  final String REGISTER = 'Kayıt Ol';
  final String LOGIN = 'Giriş Yap';

  // ----- Home View
  final String ALL_PRODUCT = 'Tüm Ürünler';
  final String PRODUCT = ' ürün';
}

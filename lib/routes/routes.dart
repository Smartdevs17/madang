class Routes {
  /// Initial Route Setter
  static Future<String> get initialRoute async {
    return login;
  }

  static const String login = "/loginScreen";
  static const String register = "/registerScreen";
  static const String auth = "/authScreen";
  static const String otp = "/otpScreen";
  static const String resetPassword = "/resetPasswordScreen";
  static const String index = "/DashboardScreen";
  static const String home = "/homeScreen";
  static const String document = "/documentScreen";
  static const String search = "/searchScreen";
  static const String searchDetail = "/searchDetailScreen";
  static const String profile = "/profileScreen";
  static const String recent = "/recentScreen";
  static const String food = "/foodScreen";
  static const String table = "/tableScreen";
  static const String cart = "/cartScreen";
  static const String payment = "/paymentScreen";
  static const String paymentMethod = '/paymentMethod';
  static const String myCart = '/myCart';
  static const String helpAndReport = '/helpAndReport';
  static const String language = '/language';
  static const String notification = '/notification';
  static const String privacyPolicy = '/privacyPolicy';
  static const String newsAndServices = '/newsAndServices';
  static const String giveRating = '/giveRating';
  static const String successOrder = '/successOrder';
}

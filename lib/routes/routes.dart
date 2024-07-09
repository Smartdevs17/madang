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
  static const String paymentMethod = '/payment-method';
  static const String myCart = '/my-cart';
  static const String helpAndReport = '/help-and-report';
  static const String language = '/language';
  static const String notification = '/notification';
  static const String privacyPolicy = '/privacy-policy';
  static const String newsAndServices = '/news-and-services';
  static const String giveRating = '/give-rating';
}

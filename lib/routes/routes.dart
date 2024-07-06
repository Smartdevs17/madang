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
  static const String foods = "/foodScreen";
  static const String tables = "/tableScreen";
  static const String cart = "/cartScreen";
  static const String payment = "/paymentScreen";
}

import 'package:get/get.dart';
import 'package:madang/features/auth/presentation/auth_screen.dart';
import 'package:madang/features/auth/presentation/login_screen.dart';
import 'package:madang/features/auth/presentation/otp_screen.dart';
import 'package:madang/features/auth/presentation/register_screen.dart';
import 'package:madang/features/cart/presentation/cart_screen.dart';
import 'package:madang/features/food/presentation/food_screen.dart';
import 'package:madang/features/home/presentation/dashboard_screen.dart';
import 'package:madang/features/home/presentation/home_screen.dart';
import 'package:madang/features/payment/presentation/success_order_screen.dart';
import 'package:madang/features/profile/presentation/cart_screen.dart';
import 'package:madang/features/profile/presentation/help_report_screen.dart';
import 'package:madang/features/profile/presentation/language_screen.dart';
import 'package:madang/features/profile/presentation/news_screen.dart';
import 'package:madang/features/profile/presentation/notification_screen.dart';
import 'package:madang/features/payment/presentation/payment_screen.dart';
import 'package:madang/features/profile/presentation/privacy_policy_screen.dart';
import 'package:madang/features/profile/presentation/profile_screen.dart';
import 'package:madang/features/profile/presentation/rating_screen.dart';
import 'package:madang/features/recent/presentation/recent_screen.dart';
import 'package:madang/features/search/presentation/search_screen.dart';
import 'package:madang/features/table/presentation/table_screen.dart';

import 'package:madang/routes/routes.dart';

///Nav Initialization
var routes = [
  GetPage(name: Routes.auth, page: () => const AuthScreen()),
  GetPage(name: Routes.login, page: () => const LoginScreen()),
  GetPage(name: Routes.register, page: () => const RegisterScreen()),
  GetPage(name: Routes.otp, page: () => const OTPScreen()),
  GetPage(name: Routes.index, page: () => DashboardScreen()),
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.search, page: () => const SearchScreen()),
  GetPage(name: Routes.recent, page: () => RecentScreen()),
  GetPage(name: Routes.profile, page: () => ProfileScreen()),
  GetPage(name: Routes.paymentMethod, page: () => const PaymentMethodScreen()),
  GetPage(name: Routes.myCart, page: () => MyCartScreen()),
  GetPage(name: Routes.helpAndReport, page: () => HelpAndReportScreen()),
  GetPage(name: Routes.language, page: () => LanguageScreen()),
  GetPage(name: Routes.notification, page: () => NotificationScreen()),
  GetPage(name: Routes.privacyPolicy, page: () => PrivacyPolicyScreen()),
  GetPage(name: Routes.newsAndServices, page: () => NewsAndServicesScreen()),
  GetPage(name: Routes.giveRating, page: () => GiveRatingScreen()),
  GetPage(name: Routes.food, page: () => FoodScreen()),
  GetPage(name: Routes.table, page: () => TableScreen()),
  GetPage(name: Routes.cart, page: () => const CartScreen()),
  GetPage(name: Routes.successOrder, page: () => const SuccessOrderScreen()),
];

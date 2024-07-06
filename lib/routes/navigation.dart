import 'package:get/get.dart';
import 'package:madang/features/auth/presentation/auth_screen.dart';
import 'package:madang/features/auth/presentation/login_screen.dart';
import 'package:madang/features/auth/presentation/otp_screen.dart';
import 'package:madang/features/auth/presentation/register_screen.dart';
import 'package:madang/features/home/presentation/home_screen.dart';
import 'package:madang/features/profile/presentation/profile_screen.dart';
import 'package:madang/features/recent/presentation/recent_screen.dart';
import 'package:madang/features/search/presentation/search_screen.dart';

import 'package:madang/routes/routes.dart';

///Nav Initialization
var routes = [
  GetPage(name: Routes.auth, page: () => const AuthScreen()),
  GetPage(name: Routes.login, page: () => const LoginScreen()),
  GetPage(name: Routes.register, page: () => const RegisterScreen()),
  GetPage(name: Routes.otp, page: () => const OTPScreen()),
  GetPage(name: Routes.home, page: () => const HomeScreen()),
  GetPage(name: Routes.search, page: () => const SearchScreen()),
  GetPage(name: Routes.recent, page: () => const RecentScreen()),
  GetPage(name: Routes.profile, page: () => const ProfileScreen()),
];

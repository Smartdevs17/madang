import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:madang/features/auth/controller/token_controller.dart';
import 'package:madang/features/cart/controller/cart_controller.dart';
import 'package:madang/features/food/controller/food_controller.dart';
import 'package:madang/features/home/controller/home_controller.dart';
import 'package:madang/features/profile/controller/profile_controller.dart';
import 'package:madang/features/table/controller/table_controller.dart';
import 'package:madang/routes/navigation.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(TokenController()); // Initialize the TokenController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      key: GlobalKey(),
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: "Madang",
      initialRoute: Get.find<TokenController>().isAuthenticated.value
          ? Routes.index
          : Routes.auth,
      getPages: routes,
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
        Get.put(ProfileController());
        Get.put(FoodController());
        Get.put(TableController());
        Get.put(HomeController());
      }),
    );
  }
}

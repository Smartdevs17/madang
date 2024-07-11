import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:madang/features/cart/controller/cart_controller.dart';
import 'package:madang/routes/navigation.dart';
import 'package:madang/routes/routes.dart';
import 'package:madang/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Get.put(TokenController()); // Initialize the TokenController
  await GetStorage.init(); // Initialize the GetStorage
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
      initialRoute: Routes.auth,
      getPages: routes,
      initialBinding: BindingsBuilder(() {
        Get.put(CartController());
      }),
    );
  }
}

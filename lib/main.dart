import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'controller/recommended_food_controller.dart';
import 'pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'controller/popular_food_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularFoodController>().getPopularFoodList();
    Get.find<RecommendedFoodController>().getRecommendedFoodList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

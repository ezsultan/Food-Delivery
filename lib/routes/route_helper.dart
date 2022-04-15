import 'package:food_delivery/pages/food/popular_food_details_page.dart';
import 'package:food_delivery/pages/food/recommended_food_detail_page.dart';
import 'package:get/get.dart';

import '../pages/home/main_food_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFoods = '/popular-foods';
  static const String recommendedFoods = '/recommended-foods';

  static String getInitial() => initial;
  static String getPopularFoods(int pageId) => '$popularFoods?pageId=$pageId';
  static String getRecommendedFoods(int pageId) =>
      '$recommendedFoods?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
      name: popularFoods,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetailPage(pageId: int.parse(pageId!));
      },
    ),
    GetPage(
        name: recommendedFoods,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetailPage(pageId: int.parse(pageId!));
        }),
  ];
}

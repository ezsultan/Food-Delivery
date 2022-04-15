import 'package:get/get.dart';

import '../controller/popular_food_controller.dart';
import '../controller/recommended_food_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/popular_food_repo.dart';
import '../data/repository/recommended_food_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  // !Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.baseUrl));

  // !Repository
  Get.lazyPut(() => PopularFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodRepo(apiClient: Get.find()));

  // !Controller
  Get.lazyPut(() => PopularFoodController(popularFoodRepo: Get.find()));
  Get.lazyPut(() => RecommendedFoodController(recommendedFoodRepo: Get.find()));
}

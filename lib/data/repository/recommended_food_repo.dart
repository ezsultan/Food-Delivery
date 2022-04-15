import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class RecommendedFoodRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedFoodRepo({required this.apiClient});

  Future<Response> getRecommendedFoodList() async {
    return await apiClient.getData(AppConstant.recommendedUriUrl);
  }
}

import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularFoodRepo extends GetxService {
  final ApiClient apiClient;
  PopularFoodRepo({required this.apiClient});

  Future<Response> getPopularFoodList() async {
    return await apiClient.getData(AppConstant.popularUriUrl);
  }
}

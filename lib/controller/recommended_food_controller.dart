import 'package:food_delivery/models/foods_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';

import '../data/repository/recommended_food_repo.dart';

class RecommendedFoodController extends GetxController {
  final RecommendedFoodRepo recommendedFoodRepo;
  RecommendedFoodController({
    required this.recommendedFoodRepo,
  });
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  List<ProductModel> _recommendedFoodList = [];
  List<ProductModel> get recommendedFoodList => _recommendedFoodList;

  Future<void> getRecommendedFoodList() async {
    Response response = await recommendedFoodRepo.getRecommendedFoodList();
    if (response.statusCode == 200) {
      _recommendedFoodList = [];
      _recommendedFoodList.addAll(Product.fromJson(response.body).product);
      update();
      _isLoaded = true;
    } else {}
  }
}

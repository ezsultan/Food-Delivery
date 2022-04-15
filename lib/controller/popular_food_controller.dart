import 'package:food_delivery/data/repository/popular_food_repo.dart';
import 'package:food_delivery/models/foods_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';

class PopularFoodController extends GetxController {
  final PopularFoodRepo popularFoodRepo;
  PopularFoodController({required this.popularFoodRepo});
  List<ProductModel> _popularFoodList = [];
  List<ProductModel> get popularFoodList => _popularFoodList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularFoodList() async {
    Response response = await popularFoodRepo.getPopularFoodList();
    if (response.statusCode == 200) {
      // print('product got');
      _popularFoodList = [];
      _popularFoodList.addAll(Product.fromJson(response.body).product);
      _isLoaded = true;

      // print(_popularFoodList);
      update();
    } else {}
  }
}

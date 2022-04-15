import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_food_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../home/main_food_page.dart';
import '../../widget/app_column.dart';
import '../../widget/app_icon.dart';
import '../../widget/big_text.dart';
import '../../widget/bottom_bar.dart';
import '../../widget/expandable_text.dart';
import '../../utils/dimensions.dart';

class PopularFoodDetailPage extends StatelessWidget {
  int pageId;
  PopularFoodDetailPage({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foods = Get.find<PopularFoodController>().popularFoodList[pageId];
    print('page id ' + pageId.toString());
    print(foods.name);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.detailFoodImg,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstant.baseUrl + AppConstant.uploads + foods.img!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  onPressed: () {
                    Get.to(() => MainFoodPage());
                  },
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.detailFoodImg - Dimensions.height20,
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  top: Dimensions.height20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: foods.name!,
                      size: Dimensions.font26,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    const BigText(
                      text: 'Introduce',
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ExpandableText(
                          text: foods.description!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomBar(
              price: foods.price!.toString(),
            ),
          ),
        ],
      ),
    );
  }
}

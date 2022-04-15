import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widget/app_icon.dart';
import 'package:food_delivery/widget/big_text.dart';
import 'package:food_delivery/widget/bottom_bar.dart';
import 'package:food_delivery/widget/expandable_text.dart';
import 'package:get/get.dart';

import '../../controller/recommended_food_controller.dart';

class RecommendedFoodDetailPage extends StatelessWidget {
  int pageId;
  RecommendedFoodDetailPage({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foods =
        Get.find<RecommendedFoodController>().recommendedFoodList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.detailFoodImg,
            elevation: 0,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.clear,
                  onPressed: () {},
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  onPressed: () {},
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstant.baseUrl + AppConstant.uploads + foods.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: BigText(
                    text: foods.name!,
                    size: Dimensions.font26,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height20,
                  ),
                  child: ExpandableText(
                    text: foods.description!,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // ! bottom bar
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                const BigText(
                  text: '\$10.00' + ' X ' + ' 0 ',
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                AppIcon(
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          const BottomBar(
            isFavorite: true,
          ),
        ],
      ),
    );
  }
}

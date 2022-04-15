import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_food_controller.dart';
import 'package:food_delivery/controller/recommended_food_controller.dart';
import 'package:food_delivery/models/foods_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/widget/app_column.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widget/big_text.dart';
import '../../widget/icon_and_text.dart';
import '../../widget/small_text.dart';

class MainFoodBody extends StatefulWidget {
  const MainFoodBody({Key? key}) : super(key: key);

  @override
  State<MainFoodBody> createState() => _MainFoodBodyState();
}

class _MainFoodBodyState extends State<MainFoodBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewController;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
    // print('screenHeight: ${Dimensions.screenHeight}');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget _buildPageItem(int index, ProductModel popularFoods) {
    Get.find<PopularFoodController>();
    Get.find<RecommendedFoodController>();
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFoods(index));
            },
            child: Container(
              height: Dimensions.pageViewController,
              margin: EdgeInsets.only(
                left: Dimensions.width5,
                right: Dimensions.width5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstant.baseUrl + "/uploads/" + popularFoods.img!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5.0,
                    offset: const Offset(0, 5),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                ),
                child: AppColumn(
                  text: popularFoods.name!,
                  size: Dimensions.font20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height10,
            ),
            // *Slider content
            GetBuilder<PopularFoodController>(
              builder: (popularFood) {
                return popularFood.isLoaded
                    ? SizedBox(
                        height: Dimensions.pageView,
                        child: PageView.builder(
                            itemCount: popularFood.popularFoodList.length,
                            controller: pageController,
                            itemBuilder: (context, position) {
                              return _buildPageItem(
                                position,
                                popularFood.popularFoodList[position],
                              );
                            }),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainBlackColor,
                        ),
                      );
              },
            ),
            // *Slider indicator
            SizedBox(
              height: Dimensions.height20,
            ),
            GetBuilder<PopularFoodController>(
              builder: (popularFood) {
                return DotsIndicator(
                  dotsCount: popularFood.popularFoodList.isEmpty
                      ? 1
                      : popularFood.popularFoodList.length,
                  position: _currentPageValue,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeColor: AppColors.mainColor,
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                );
              },
            ),

            // *Popular text
            SizedBox(
              height: Dimensions.height20,
            ),
            Container(
              margin: EdgeInsets.only(
                left: Dimensions.width30,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const BigText(
                    text: 'Recommended',
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: const BigText(
                      text: '.',
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 1,
                    ),
                    child: const SmallText(
                      text: 'Food pairing',
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
            // *Recommended food list
            GetBuilder<RecommendedFoodController>(
              builder: (recommendedFood) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedFood.recommendedFoodList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFoods(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          bottom: Dimensions.height20,
                          right: Dimensions.width20,
                        ),
                        child: Row(
                          children: [
                            // *Food image
                            Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius20,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    AppConstant.baseUrl +
                                        "/uploads/" +
                                        recommendedFood
                                            .recommendedFoodList[index].img!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // *Food info
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewContSize,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomEnd: Radius.circular(
                                      Dimensions.radius20,
                                    ),
                                    topEnd: Radius.circular(
                                      Dimensions.radius20,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        text: recommendedFood
                                            .recommendedFoodList[index].name!,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      SmallText(
                                        text: recommendedFood
                                            .recommendedFoodList[index]
                                            .description!,
                                        color: Colors.black26,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          IconAndText(
                                            text: 'Normal',
                                            icon: Icons.circle,
                                            color: AppColors.textColor,
                                            iconColor: AppColors.iconColor1,
                                            size: 14,
                                          ),
                                          IconAndText(
                                            text: '1.7 km',
                                            icon: Icons.location_on,
                                            color: AppColors.mainColor,
                                            iconColor: AppColors.mainColor,
                                            size: 14,
                                          ),
                                          IconAndText(
                                            text: '32 min',
                                            icon: Icons.timer,
                                            color: AppColors.iconColor2,
                                            iconColor: AppColors.iconColor2,
                                            size: 14,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

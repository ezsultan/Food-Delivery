import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

import 'big_text.dart';

class BottomBar extends StatelessWidget {
  final bool isFavorite;
  final int quantity;
  final String price;
  const BottomBar({
    Key? key,
    this.isFavorite = false,
    this.quantity = 0,
    this.price = '0',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height120,
      padding: EdgeInsets.only(
        left: Dimensions.width20,
        right: Dimensions.width20,
        top: Dimensions.height30,
        bottom: Dimensions.height30,
      ),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius20 * 2),
          topRight: Radius.circular(Dimensions.radius20 * 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: Dimensions.iconSize24,
                    )
                  : Row(
                      children: [
                        const Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                        SizedBox(
                          width: Dimensions.width5,
                        ),
                        BigText(text: quantity.toString()),
                        SizedBox(
                          width: Dimensions.width5,
                        ),
                        const Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ],
                    )),
          Container(
            padding: EdgeInsets.all(Dimensions.height20),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: BigText(
              text: '\$ $price | Add to cart',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'small_text.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final double size;
  const AppColumn({
    Key? key,
    required this.text,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: size,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            const SmallText(
              text: '4.5',
              color: AppColors.textColor,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            const SmallText(
              text: '89',
              color: AppColors.textColor,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            const SmallText(
              text: 'Comments',
              color: AppColors.textColor,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
              text: 'Normal',
              icon: Icons.circle,
              color: AppColors.textColor,
              iconColor: AppColors.iconColor1,
            ),
            IconAndText(
              text: '1.7 km',
              icon: Icons.location_on,
              color: AppColors.mainColor,
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              text: '32 min',
              icon: Icons.timer,
              color: AppColors.iconColor2,
              iconColor: AppColors.iconColor2,
            ),
          ],
        )
      ],
    );
  }
}

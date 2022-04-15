import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widget/small_text.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final double size;
  final Color? iconColor;
  const IconAndText({
    Key? key,
    required this.text,
    required this.icon,
    this.size = 24,
    this.color,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: size,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(
          text: text,
          color: color,
        ),
      ],
    );
  }
}

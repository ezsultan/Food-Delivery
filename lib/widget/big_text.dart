import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final TextOverflow overflow;
  const BigText({
    Key? key,
    required this.text,
    this.size = 0,
    this.color,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font20 : size,
        color: color,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

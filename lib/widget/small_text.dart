import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final double height;
  final int? maxLines;
  final TextOverflow? overflow;
  const SmallText({
    Key? key,
    required this.text,
    this.size = 0,
    this.color,
    this.height = 1.2,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font14 : size,
        color: color,
        fontWeight: FontWeight.w400,
        height: height,
      ),
    );
  }
}

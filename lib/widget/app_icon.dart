import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final double size;
  final IconData icon;
  final VoidCallback? onPressed;
  const AppIcon({
    Key? key,
    required this.icon,
    this.size = 40,
    this.bgColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashRadius: Dimensions.height30,
        icon: Icon(
          icon,
          color: iconColor,
          size: 18,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

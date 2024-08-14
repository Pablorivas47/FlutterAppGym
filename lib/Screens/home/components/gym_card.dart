import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

// ignore: must_be_immutable
class GymCard extends StatelessWidget {
  final String name;
  final ImageProvider<Object> image;
  final Function()? onTap;
  final EdgeInsets padding;
  final double? width;
  final double? height;

  const GymCard({
    super.key,
    required this.name,
    required this.onTap,
    required this.image,
    required this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.05),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image,
          ),
        ),
        duration: const Duration(microseconds: 1),
        child: Center(
          child: Padding(
            padding: padding,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.screenHeight * 0.02,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

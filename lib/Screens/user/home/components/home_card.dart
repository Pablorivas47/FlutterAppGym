import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  final String name;
  final ImageProvider<Object> image;
  final Function()? onTap;
  final EdgeInsets paddingText;
  final double? width;
  final double? height;
  double? heightFactor;
  final AlignmentGeometry alignmentImage;

  HomeCard({
    super.key,
    required this.name,
    required this.onTap,
    required this.image,
    required this.paddingText,
    this.width,
    this.height,
    this.heightFactor,
    required this.alignmentImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: width,
        height: height,
        decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(milliseconds: 300),
        child: Stack(
          children: [
            Align(
              alignment: alignmentImage, // Alinea la imagen en el centro
              child: FractionallySizedBox(
                heightFactor: heightFactor, // Ajusta la altura de la imagen
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: image,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: paddingText,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.screenHeight * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.plus_app,
                      color: Colors.white,
                      size: SizeConfig.screenHeight * 0.02,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

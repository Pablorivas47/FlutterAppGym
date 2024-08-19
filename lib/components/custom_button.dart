import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

CupertinoButton customCircleCupButton({
  required VoidCallback onPressed,
  required Image image,
}) {
  return CupertinoButton(
    borderRadius: BorderRadius.circular(10),
    padding: EdgeInsets.zero,
    color: const Color.fromARGB(255, 255, 255, 255),
    onPressed: onPressed,
    child: image,
  );
}

CupertinoButton customCupButtonTimer({
  required String text,
  required VoidCallback onPressed,
}) {
  return CupertinoButton(
    padding: EdgeInsets.zero,
    color: Colors.white,
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig.screenWidth * 0.03,
        fontFamily: "Inter",
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

OutlinedButton customMaterialButton({
  required String hintText,
  required IconData icon,
  required Color colorOutline,
  required VoidCallback press,
}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: colorOutline,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
    ),
    onPressed: press,
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: SizeConfig.screenHeight * 0.02,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.0223,
        ),
        Text(
          hintText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w300,
            fontSize: SizeConfig.screenWidth * 0.04,
          ),
        ),
        const Spacer(),
        Icon(
          CupertinoIcons.chevron_forward,
          color: Colors.white,
          size: SizeConfig.screenHeight * 0.02,
        ),
      ],
    ),
  );
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final AlignmentGeometry alignment;
  final Color? textColor;
  String? routeNamePlacement;
  final VoidCallback press;
  final EdgeInsets? paddingButton;

  CustomButton({
    super.key,
    required this.color,
    required this.text,
    required this.borderRadius,
    required this.padding,
    required this.alignment,
    this.textColor,
    this.routeNamePlacement,
    required this.press,
    this.paddingButton,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.5,
      color: color,
      padding: padding,
      borderRadius: borderRadius,
      alignment: alignment,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.screenWidth * 0.04,
        ),
      ),
    );
  }
}

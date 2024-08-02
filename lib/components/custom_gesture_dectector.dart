import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_1/constants/size_config.dart';


GestureDetector customGesture(
  TextEditingController controller,{
  required String text,
  required Color textColor,
  required VoidCallback onTap,
  
}) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text, 
      style: TextStyle(
        color: textColor,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: SizeConfig.screenWidth*0.03,
      ),
    ),
  );
}






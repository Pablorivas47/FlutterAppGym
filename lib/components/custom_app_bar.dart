import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String text;
  final Color? colorText;
  final bool automaticallyImplyLeading;
  final EdgeInsets padding;
    const CustomAppBar({
    super.key, 
    required this.text, 
    required this.colorText, 
    required this.automaticallyImplyLeading, 
    required this.padding,
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),

      title: Padding(
        
        padding: padding,
        child: Text( 
          
          text, 
          style: TextStyle(
            color: colorText,
            fontFamily: "Inter",
            fontSize: SizeConfig.screenWidth*0.045,
            fontWeight: FontWeight.w600,
        )
            
        ),
      ),
    );
  }
  
  @override // Size AppBar
  Size get preferredSize {return  Size(
    SizeConfig.screenWidth,
    SizeConfig.screenHeight*0.08
  );} 
}
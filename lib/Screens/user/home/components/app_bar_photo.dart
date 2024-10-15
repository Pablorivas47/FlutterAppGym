import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class AppBarPhoto extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool automaticallyImplyLeading;
  final EdgeInsets padding;
  const AppBarPhoto({
    super.key,
    required this.text,
    required this.automaticallyImplyLeading,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontSize: SizeConfig.screenWidth * 0.045,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  @override // Size AppBar
  Size get preferredSize {
    return Size(
      SizeConfig.screenWidth,
      SizeConfig.screenHeight * 0.1,
    );
  }
}

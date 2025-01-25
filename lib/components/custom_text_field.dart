import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

TextFormField lineTextFormField(TextEditingController controller,
    {bool? enableText,
    String hintText = "nombre de rutina:", // Texto predeterminado del label
    Icon? icon,
    TextInputType? keyboardType,
    Color? colorHintText,
    Color? colorIcon,
    Color? labelColor = Colors.white,
    Color? colorText = Colors.white}) {
  return TextFormField(
    controller: controller,
    enabled: enableText,
    cursorColor: Colors.white,
    cursorWidth: SizeConfig.screenWidth * 0.003,
    style: TextStyle(
      color: colorText,
      fontFamily: "Inter",
      fontSize: SizeConfig.screenHeight * 0.02,
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.transparent, // Fondo transparente
      prefixIcon: icon,
      hintText: hintText,
      hintStyle: TextStyle(
        color: colorHintText,
        fontFamily: "Inter",
        fontSize: SizeConfig.screenHeight * 0.02,
        fontWeight: FontWeight.w300,
      ),
      contentPadding: EdgeInsets.zero,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}

TextFormField eMailTextFormField(
  TextEditingController controller, {
  required String hintText,
  required double fontSizeTextStyle,
  required FontWeight fontWeightTextStyle,
  required EdgeInsets contentPadding,
  required double fontSizeHintText,
  required FontWeight fontWeightHintText,
  required Color colorHintText,
  Color? fillColor,
  required bool filled,
  required Color cursorColor,
  required Color colorTextIn,
  required Color colorIcon,
  required double sizeIcon,
  required BorderRadius borderRadius,
  required Color colorBorderRadiusOutline,
  required Color colorEnableBorder,
}) {
  return TextFormField(
    strutStyle: StrutStyle(
      height: SizeConfig.screenHeight * 0.0015,
    ),
    controller: controller,
    cursorColor: cursorColor,
    cursorWidth: SizeConfig.screenWidth * 0.003,
    style: TextStyle(
      color: colorTextIn,
      fontFamily: "Inter",
      fontSize: fontSizeTextStyle,
      fontWeight: fontWeightTextStyle,
    ),
    decoration: InputDecoration(
      suffixIcon: Icon(
        CupertinoIcons.person_solid,
        color: colorIcon,
        size: sizeIcon,
      ),
      contentPadding: contentPadding,
      filled: filled,
      fillColor: fillColor,
      hintText: 'E-Mail',
      hintStyle: TextStyle(
        color: colorHintText,
        fontFamily: "Inter",
        fontSize: fontSizeHintText,
        fontWeight: fontWeightHintText,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius, // Bordes redondeados
        borderSide: BorderSide(
          color: colorEnableBorder, // Color del borde cuando está habilitado
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: colorBorderRadiusOutline,
        ),
      ),
    ),
    validator: (text) {
      if (text == null || text.trim().isEmpty) {
        return "Email is empty";
      }
      return null;
    },
  );
}

TextFormField customTextFormField(
  TextEditingController controller, {
  required String hintText,
  bool? enableText,
  String? labelText,
  Icon? icon,
  TextInputType? keyboardType,
  bool? filled,
  Color? fillColor,
}) {
  return TextFormField(
    controller: controller,
    enabled: enableText,
    cursorColor: Colors.white,
    cursorWidth: SizeConfig.screenWidth * 0.003,
    style: TextStyle(
      color: Colors.white,
      fontFamily: "Inter",
      fontSize: SizeConfig.screenHeight * 0.02,
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      filled: filled,
      fillColor: fillColor,
      prefixIcon: icon,
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.04,
        vertical: SizeConfig.screenHeight * 0.02,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontFamily: "Inter",
        fontSize: SizeConfig.screenHeight * 0.02,
        fontWeight: FontWeight.w200,
      ),
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontFamily: "Inter",
        fontSize: SizeConfig.screenHeight * 0.02,
        fontWeight: FontWeight.w200,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            SizeConfig.screenWidth * 0.02), // Bordes redondeados
        borderSide: const BorderSide(
          color: Colors.white70, // Color del borde cuando está habilitado
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            SizeConfig.screenWidth * 0.02), // Bordes redondeados
        borderSide: const BorderSide(
          color: Colors.white70, // Color del borde cuando está habilitado
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 238, 199, 199),
        ),
      ),
    ),
  );
}

TextFormField personalizeTextFormField(TextEditingController controller,
    {required String hintText,
    bool? enableText,
    String? labelText,
    Icon? icon,
    TextInputType? keyboardType,
    bool? filled,
    Color? fillColor,
    Color? colorHintText,
    Color? colorIcon,
    Color? labelColor,
    Color? colorText}) {
  return TextFormField(
    controller: controller,
    enabled: enableText,
    cursorColor: Colors.white,
    cursorWidth: SizeConfig.screenWidth * 0.003,
    style: TextStyle(
      color: colorText,
      fontFamily: "Inter",
      fontSize: SizeConfig.screenHeight * 0.02,
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      filled: filled,
      fillColor: fillColor,
      prefixIcon: icon,
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.04,
        vertical: SizeConfig.screenHeight * 0.02,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: colorHintText,
        fontFamily: "Inter",
        fontSize: SizeConfig.screenHeight * 0.02,
        fontWeight: FontWeight.w300,
      ),
      labelText: labelText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(
        color: labelColor,
        fontFamily: "Inter",
        fontSize: SizeConfig.screenHeight * 0.02,
        fontWeight: FontWeight.w300,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

// ignore: must_be_immutable
class Password extends StatefulWidget {
  final TextEditingController pController;
  final double fontSizeTextStyle;
  final FontWeight fontWeightTextStyle;
  final EdgeInsets contentPadding;
  final double fontSizeHintText;
  final FontWeight fontWeightHintText;
  final Color colorHintText;
  final Color fillColor;
  final bool filled;
  final Color cursorColor;
  final Color colorTextIn;
  final Color colorIcon;
  final double sizeIcon;
  final BorderRadius borderRadius;
  final Color colorBorderRadiusOutline;
  final Color colorEnableBorder;
  final String textPassword;

  const Password({
    super.key,
    required this.pController,
    required this.fontSizeTextStyle,
    required this.fontWeightTextStyle,
    required this.contentPadding,
    required this.fontSizeHintText,
    required this.fontWeightHintText,
    required this.colorHintText,
    required this.filled,
    required this.cursorColor,
    required this.colorTextIn,
    required this.colorIcon,
    required this.sizeIcon,
    required this.borderRadius,
    required this.colorBorderRadiusOutline,
    required this.colorEnableBorder,
    required this.fillColor,
    required this.textPassword,
  });

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool isObscured = true;

  void changeIconPassword() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      controller: widget.pController,
      cursorColor: widget.cursorColor,
      cursorWidth: SizeConfig.screenWidth * 0.003,
      style: TextStyle(
        color: widget.colorTextIn,
        fontFamily: "Inter",
        fontSize: widget.fontSizeTextStyle,
        fontWeight: widget.fontWeightTextStyle,
      ),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            changeIconPassword();
          },
          child: Icon(
            //condicion ? valorSiCondicionEsVerdadera : valorSiCondicionEsFalsa;
            isObscured
                ? CupertinoIcons.lock_fill
                : CupertinoIcons.lock_open_fill,
            color: widget.colorIcon,
            size: widget.sizeIcon,
          ),
        ),
        contentPadding: widget.contentPadding,
        filled: widget.filled,
        fillColor: widget.fillColor,
        hintText: widget.textPassword,
        hintStyle: TextStyle(
          color: widget.colorHintText,
          fontFamily: "Inter",
          fontSize: widget.fontSizeHintText,
          fontWeight: widget.fontWeightHintText,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius, // Bordes redondeados
          borderSide: BorderSide(
            color: widget
                .colorEnableBorder, // Color del borde cuando está habilitado
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(
            color: widget.colorBorderRadiusOutline,
          ),
        ),
      ),
      strutStyle: StrutStyle(
        height: SizeConfig.screenHeight * 0.0015,
      ),
      validator: (text) {
        if (text == null || text.trim().isEmpty) {
          return "Password is empty";
        }
        return null;
      },
    );
  }
}

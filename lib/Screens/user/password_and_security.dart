import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_gesture_dectector.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class PasswordAndSecurity extends StatefulWidget {
  const PasswordAndSecurity({super.key});

  @override
  State<PasswordAndSecurity> createState() => _PasswordAndSecurityState();
}

class _PasswordAndSecurityState extends State<PasswordAndSecurity> {
  TextEditingController passwordCurrent = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController forgetPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 17, 17, 17),
        appBar: const CustomAppBar(
          text: 'Constraña y Seguridad',
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.0223,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.09),
              child: Text(
                "Cambiar contraseña",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.screenHeight * 0.0175,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.001,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.09),
              child: Text(
                "La contraseña debe tener al menos 6 caracteres e incluir una combinacion de numero y letra",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                  fontSize: SizeConfig.screenHeight * 0.0175,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.0223,
            ),
            Container(
              //Textfield password
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.09),
              child: Password(
                pController: passwordCurrent,
                fontSizeTextStyle: SizeConfig.screenHeight * 0.02,
                fontWeightTextStyle: FontWeight.w400,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.04,
                  vertical: SizeConfig.screenHeight * 0.02,
                ),
                fontSizeHintText: SizeConfig.screenHeight * 0.02,
                fontWeightHintText: FontWeight.w200,
                colorHintText: Colors.white,
                filled: false,
                cursorColor: Colors.white,
                colorTextIn: Colors.white,
                colorIcon: Colors.white,
                sizeIcon: SizeConfig.screenWidth * 0.05,
                borderRadius: BorderRadius.circular(7),
                colorBorderRadiusOutline:
                    const Color.fromARGB(255, 238, 199, 199),
                colorEnableBorder: Colors.white70,
                fillColor: Colors.transparent,
                textPassword: 'Contraseña actual',
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.0223,
            ),
            Container(
              //Textfield password
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.09),
              child: Password(
                pController: newPassword,
                fontSizeTextStyle: SizeConfig.screenHeight * 0.02,
                fontWeightTextStyle: FontWeight.w400,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.04,
                  vertical: SizeConfig.screenHeight * 0.02,
                ),
                fontSizeHintText: SizeConfig.screenHeight * 0.02,
                fontWeightHintText: FontWeight.w200,
                colorHintText: Colors.white,
                filled: false,
                cursorColor: Colors.white,
                colorTextIn: Colors.white,
                colorIcon: Colors.white,
                sizeIcon: SizeConfig.screenWidth * 0.05,
                borderRadius: BorderRadius.circular(7),
                colorBorderRadiusOutline:
                    const Color.fromARGB(255, 238, 199, 199),
                colorEnableBorder: Colors.white70,
                fillColor: Colors.transparent,
                textPassword: 'Nueva contraseña',
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.0223,
            ),
            Container(
              //Textfield password
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.09),
              child: Password(
                pController: confirmPassword,
                fontSizeTextStyle: SizeConfig.screenHeight * 0.02,
                fontWeightTextStyle: FontWeight.w400,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.04,
                  vertical: SizeConfig.screenHeight * 0.02,
                ),
                fontSizeHintText: SizeConfig.screenHeight * 0.02,
                fontWeightHintText: FontWeight.w200,
                colorHintText: Colors.white,
                filled: false,
                cursorColor: Colors.white,
                colorTextIn: Colors.white,
                colorIcon: Colors.white,
                sizeIcon: SizeConfig.screenWidth * 0.05,
                borderRadius: BorderRadius.circular(7),
                colorBorderRadiusOutline:
                    const Color.fromARGB(255, 238, 199, 199),
                colorEnableBorder: Colors.white70,
                fillColor: Colors.transparent,
                textPassword: 'Confirmar contraseña',
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.0223,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.09),
              child: customGesture(forgetPassword,
                  text: '¿Olvidaste tu contraseña?',
                  textColor: Colors.white,
                  onTap: () {}),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.0223,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                  width: SizeConfig.screenWidth * 0.6,
                  height: SizeConfig.screenHeight * 0.06,
                  color: const Color(0xFF246B84),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.02,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.screenWidth * 0.02)),
                  alignment: Alignment.center,
                  text: "Cambiar datos",
                  textColor: Colors.white,
                  press: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

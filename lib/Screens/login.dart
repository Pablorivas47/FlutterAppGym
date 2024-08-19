import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/components/custom_gesture_dectector.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/form_validation.dart';
import 'package:flutter_application_1/constants/errores/validation_error_manager.dart';
import 'package:flutter_application_1/constants/errores/validation_error_messages.dart';
import 'package:flutter_application_1/constants/size_config.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController eMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgetPassword = TextEditingController();
  TextEditingController singUp = TextEditingController();
  Map<String, String?> errorSingIn = {};
  Timer? timer;
  bool logged = true;

  void signInErrorValidation() {
    setState(() {
      // Primero realizamos la validación local
      errorSingIn = signInErrorValidationMap(
        errorSingIn,
        eMailController.text,
        passwordController.text,
        logged,
      );
      if (errorSingIn.isNotEmpty) {
        startErrorTimerSignIn();
      } else {
        timer
            ?.cancel(); // Cancelamos el temporizador si no hay errores de validación
      }
    });
  }

  void startErrorTimerSignIn() {
    timer = Timer(defaultDuration, () {
      setState(() {
        errorSingIn.clear();
      });
    });
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await AuthService().loginEmailAndPassword(
        email: eMailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException {
      setState(() {
        logged = false;
        signInErrorValidation();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Login.jpg"),
        ),
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.09,
                right: SizeConfig.screenWidth * 0.09,
                top: SizeConfig.screenHeight * 0.3,
                bottom: SizeConfig.screenHeight * 0.09,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.345),
                const Text(
                  //Text GYM PASS
                  "GYM PASS",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Container(
                  // textfield User/Email
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.16),

                  child: eMailTextFormField(
                    eMailController,
                    hintText: "E-Mail",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.04,
                      vertical: SizeConfig.screenHeight * 0.01,
                    ),
                    fontSizeTextStyle: SizeConfig.screenWidth * 0.035,
                    fontWeightTextStyle: FontWeight.w400,
                    fontSizeHintText: SizeConfig.screenWidth * 0.035,
                    fontWeightHintText: FontWeight.w300,
                    colorHintText: const Color.fromARGB(255, 0, 0, 0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 216, 216),
                    cursorColor: Colors.black,
                    colorTextIn: Colors.black,
                    colorIcon: Colors.black,
                    sizeIcon: SizeConfig.screenWidth * 0.05,
                    borderRadius: BorderRadius.zero,
                    colorBorderRadiusOutline: Colors.transparent,
                    colorEnableBorder: Colors.transparent,
                  ),
                ),
                FormValidationMap(
                  errors: errorSingIn,
                  // controller: eMailController,
                  textController: 'email',
                  padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.14,
                    top: SizeConfig.screenHeight * 0.005,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                Container(
                  //Textfield password
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.16),
                  child: Password(
                    pController: passwordController,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.04,
                      vertical: SizeConfig.screenHeight * 0.01,
                    ),
                    fontSizeTextStyle: SizeConfig.screenWidth * 0.035,
                    fontWeightTextStyle: FontWeight.w400,
                    fontSizeHintText: SizeConfig.screenWidth * 0.035,
                    fontWeightHintText: FontWeight.w300,
                    colorHintText: const Color.fromARGB(255, 0, 0, 0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 216, 216),
                    cursorColor: Colors.black,
                    colorTextIn: Colors.black,
                    colorIcon: Colors.black,
                    sizeIcon: SizeConfig.screenWidth * 0.05,
                    borderRadius: BorderRadius.zero,
                    colorBorderRadiusOutline: Colors.transparent,
                    colorEnableBorder: Colors.transparent,
                    textPassword: 'Contraseña',
                  ),
                ),
                FormValidationMap(
                  errors: errorSingIn,
                  // controller: passwordController,
                  textController: 'password',
                  padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth * 0.14,
                      top: SizeConfig.screenHeight * 0.005),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                CustomButton(
                    //Button sing in
                    color: const Color(0xFF246B84),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 0.0175,
                      horizontal: SizeConfig.screenWidth * 0.08,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.screenWidth * 0.02)),
                    alignment: Alignment.center,
                    text: "Iniciar sesion",
                    textColor: Colors.white,
                    press: () async {
                      signInErrorValidation();
                      if (errorSingIn.isEmpty) {
                        await signInWithEmailAndPassword();
                      } else {
                        logged = true;
                      }
                    }),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                customGesture(
                  forgetPassword,
                  text: '¿Olvidaste la contraseña?',
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, '/forgetPassword');
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                Container(
                  //Animation Circle
                  width: SizeConfig.screenWidth * 0.027,
                  height: SizeConfig.screenWidth * 0.027,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customCircleCupButton(
                      onPressed: () {},
                      image: Image.asset(
                        "assets/image/Google.png",
                        scale: SizeConfig.screenHeight * 0.04,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenHeight * 0.02,
                    ),
                    customCircleCupButton(
                      onPressed: () {},
                      image: Image.asset(
                        "assets/image/Facebook.png",
                        scale: SizeConfig.screenHeight * 0.06,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                RichText(
                  text: TextSpan(
                    text: '¿No tenes cuenta aun? ', // Texto normal
                    style: TextStyle(
                      color: Colors.white, // Color del texto normal
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize:
                          SizeConfig.screenWidth * 0.03, // Tamaño de fuente
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Registrate aqui', // Texto con estilo diferente
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 140, 254),
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.screenWidth * 0.03,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/singUp');
                          },
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ])),
    );
  }
}

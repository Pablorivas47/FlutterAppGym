import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/sign_in_up.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_dropdown_menu.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/form_validation.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/constants/errores/validation_error_manager.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController gController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Map<String, String?> errorsSingUp = {};
  bool isLoading = false;

  void clearErrorsAfterDelay() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        errorsSingUp.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomAppBar(
            text: "Registrarse",
            colorText: Colors.white,
            automaticallyImplyLeading: true,
            padding: EdgeInsets.zero,
          ),
          body: Stack(
            children: [
              if (isLoading) const Center(child: CircularProgressIndicator()),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.09,
                      ),
                      child: Text(
                        "Crea tu cuenta para acceder a GYM PASS",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: SizeConfig.screenWidth * 0.04,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.09),
                      child: customTextFormField(
                        nameController,
                        hintText: "Nombre",
                      ),
                    ),
                    FormValidationMap(
                      errors: errorsSingUp,
                      // controller: nameController,
                      textController: 'name',
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.075,
                          top: SizeConfig.screenHeight * 0.005),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.09),
                      child: customTextFormField(apellidoController,
                          hintText: "Apellido"),
                    ),
                    FormValidationMap(
                      errors: errorsSingUp,
                      //controller: apellidoController,
                      textController: 'nickname',
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.075,
                          top: SizeConfig.screenHeight * 0.005),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.09),
                      child: eMailTextFormField(
                        eMailController,
                        hintText: "E-Mail",
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
                      ),
                    ),
                    FormValidationMap(
                      errors: errorsSingUp,
                      //controller: eMailController,
                      textController: 'email',
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.075,
                          top: SizeConfig.screenHeight * 0.005),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    CustomDropdownMenu(
                      genderController: gController,
                    ),
                    FormValidationMap(
                      errors: errorsSingUp,
                      textController: 'gender',
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.075,
                          top: SizeConfig.screenHeight * 0.005),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.09),
                      child: customTextFormField(
                        phoneNumberController,
                        hintText: 'Numero de Telefono:',
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    FormValidationMap(
                      errors: errorsSingUp,
                      //controller: phoneNumberController,
                      textController: 'phonenumber',
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.075,
                          top: SizeConfig.screenHeight * 0.005),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    Container(
                      //Textfield password
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.09),
                      child: Password(
                        pController: passwordController,
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
                    FormValidationMap(
                      errors: errorsSingUp,
                      //controller: passwordController,
                      textController: 'password',
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.075,
                          top: SizeConfig.screenHeight * 0.005),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.025,
                    ),
                    Container(
                      //Textfield password
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.09),
                      child: Password(
                        pController: confirmPasswordController,
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
                    FormValidationMap(
                      errors: errorsSingUp,
                      //controller: confirmPasswordController,
                      textController: 'confirmpassword',
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.075,
                          top: SizeConfig.screenHeight * 0.005),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    CustomButton(
                      color: const Color(0xFF246B84),
                      text: "Crear cuenta",
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.screenWidth * 0.02)),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.295,
                        vertical: SizeConfig.screenHeight * 0.0175,
                      ),
                      alignment: Alignment.center,
                      press: () async {
                        setState(() {
                          isLoading = true; // Comienza la carga
                        });

                        bool created =
                            await AuthService().createUserEmailAndPassword(
                          email: eMailController.text,
                          password: passwordController.text,
                          displayName: nameController.text,
                          nickName: apellidoController.text,
                          gender: gController.text,
                          phoneNumber: phoneNumberController.text,
                        );

                        setState(() {
                          signUpErrorValidationMap(
                            errorsSingUp,
                            nameController.text,
                            apellidoController.text,
                            eMailController.text,
                            gController.text,
                            phoneNumberController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                            created,
                          );
                        });

                        if (errorsSingUp.isEmpty) {
                          await FirebaseAuth.instance.currentUser?.reload();
                          Navigator.pushAndRemoveUntil(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignInOut()), // Reemplaza LoginScreen con tu widget de login
                            (Route<dynamic> route) =>
                                true, // Elimina todas las rutas anteriores
                          );
                        } else {
                          // Si hay errores, los limpiamos después de 3 segundos
                          clearErrorsAfterDelay();
                        }

                        setState(() {
                          isLoading = false; // Detiene la carga
                        });
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

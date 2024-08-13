import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_dropdown_menu.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController gController = TextEditingController();
  TextEditingController singoffController = TextEditingController();
  User userS = FirebaseAuth.instance.currentUser!;

  Future<void> signOut() async {
    await AuthService().singOutLogin();
  }

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
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: userS.displayName!,
          colorText: Colors.white,
          automaticallyImplyLeading: false,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customTextFormField(
                  nameController,
                  hintText: 'Nombre:',
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customTextFormField(
                  usernameController,
                  hintText: 'Nombre de usuario:',
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customTextFormField(
                  nicknameController,
                  hintText: 'Fecha de nacimiento:',
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
              CustomDropdownMenu(
                genderController: gController,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.06),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customMaterialButtom(
                  hintText: 'Datos Personales',
                  icon: CupertinoIcons.person_crop_circle,
                  colorOutline: Colors.white70,
                  press: () {
                    Navigator.pushNamed(
                      context,
                      '/personalInformation',
                    );
                  },
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01115),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customMaterialButtom(
                  hintText: 'Contraseña y seguridad',
                  icon: CupertinoIcons.shield,
                  colorOutline: Colors.white70,
                  press: () {
                    Navigator.pushNamed(
                      context,
                      '/passwordAndSecurity',
                    );
                  },
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01115),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customMaterialButtom(
                  hintText: 'Cerrar sesion',
                  icon: CupertinoIcons.square_arrow_right,
                  colorOutline: Colors.red,
                  press: signOut,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
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
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> signOut() async {
    await AuthService().singOutLogin();
  }

  Future<void> loadUserData() async {
    try {
      DocumentSnapshot snapshot = await getUserData();
      setState(() {
        userData = snapshot.data() as Map<String, dynamic>;
      });
    } catch (e) {
      print("Error loading user data: $e");
    }
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
          text: "Hola ${userS.displayName!}",
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
                  enableText: false,
                  labelText: "Nombre completo:",
                  hintText: "${userData!['name']} ${userData!['apellido']} ",
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customTextFormField(
                  usernameController,
                  enableText: false,
                  labelText: "E-Mail:",
                  hintText: userData!['email'],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customTextFormField(
                  nicknameController,
                  enableText: false,
                  labelText: "Numero de telefono:",
                  hintText: userData!['Numero de telefono'],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.0223),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customTextFormField(
                  nicknameController,
                  enableText: false,
                  labelText: "Ubicacion:",
                  hintText: "ubicacion  (hacerlo)",
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09),
                child: customMaterialButton(
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
                child: customMaterialButton(
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
                child: customMaterialButton(
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

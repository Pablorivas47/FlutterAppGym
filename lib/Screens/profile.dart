import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
  }

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
      child: FutureBuilder(
        future: context.watch<ProviderService>().providerGetUserData(),
        builder: (context, snapshot) {
          if (context.watch<ProviderService>().userData == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: CustomAppBar(
                text: "Hola ${context.watch<ProviderService>().userData!.name}",
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
                        hintText:
                            "${context.watch<ProviderService>().userData!.name} ${context.watch<ProviderService>().userData!.nickName} ",
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
                        hintText:
                            context.watch<ProviderService>().userData!.email,
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
                        hintText: context
                            .watch<ProviderService>()
                            .userData!
                            .numberPhone,
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
            );
          }
        },
      ),
    );
  }
}

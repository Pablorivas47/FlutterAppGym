import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/auth.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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
        future: context.read<ProviderService>().providerGetAdminAndGymData(),
        builder: (context, snapshot) {
          if (context.read<ProviderService>().adminGymData == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: CustomAppBar(
                text: context
                        .watch<ProviderService>()
                        .adminGymData?['gym']
                        .name ??
                    '',
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
                        phoneNumberController,
                        enableText: false,
                        labelText: "Numero de telefono:",
                        hintText: context
                                .watch<ProviderService>()
                                .adminGymData?['gym']
                                .phoneNumber
                                .toString() ??
                            '',
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0223),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.09),
                      child: customTextFormField(
                        locationController,
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
                            '/adminPersonalInformation',
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

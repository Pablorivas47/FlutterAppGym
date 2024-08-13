import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController contactInformation = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController ubication = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User userS = FirebaseAuth.instance.currentUser!;

  ValueNotifier<bool> hasChanged = ValueNotifier(false);

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
            text: 'Datos Personales',
            colorText: Colors.white,
            automaticallyImplyLeading: true,
            padding: EdgeInsets.zero,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.0223),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09,
                  ),
                  child: customTextFormField(
                    contactInformation,
                    hintText: 'Informacion de contacto:',
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09,
                  ),
                  child: customTextFormField(
                    phoneNumber,
                    hintText: 'Numero de telefono',
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09,
                  ),
                  child: customTextFormField(
                    birthDate,
                    hintText: 'Fecha de nacimiento',
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.0223,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.09,
                  ),
                  child: customTextFormField(
                    ubication,
                    hintText: 'Ubicacion:',
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.2),
                CustomButton(
                    //Button Change information
                    color: const Color(0xFF246B84),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 0.0175,
                      horizontal: SizeConfig.screenWidth * 0.28,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.screenWidth * 0.02)),
                    alignment: Alignment.center,
                    text: "Cambiar datos",
                    textColor: Colors.white,
                    press: () {
                      updatePerson(
                        contactInformation.text,
                      );
                    }),
              ],
            ),
          )),
    );
  }
}

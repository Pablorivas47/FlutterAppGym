import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<ProviderService>().providerGetUserData(),
      builder: (context, snapshot) {
        if (context.watch<ProviderService>().userData == null) {
          return shimmerLoadingEffect();
        } else {
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
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.0223,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.09,
                      ),
                      child: customTextFormField(
                        phoneNumber,
                        labelText: "Numero de telefono:",
                        hintText: context
                            .watch<ProviderService>()
                            .userData!
                            .numberPhone,
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
                        labelText: "Fecha de nacimiento:",
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
                        labelText: "Ubicación:",
                        hintText: 'Ubicación',
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.2),
                    CustomButton(
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
                        context.watch<ProviderService>().providerUpdateIUser(
                              phoneNumber.text,
                            );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget shimmerLoadingEffect() {
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
          child: Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.0223),
                shimmerContainer(
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.82),
                SizedBox(height: SizeConfig.screenHeight * 0.0223),
                shimmerContainer(
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.82),
                SizedBox(height: SizeConfig.screenHeight * 0.0223),
                shimmerContainer(
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.82),
                SizedBox(height: SizeConfig.screenHeight * 0.0223),
                shimmerContainer(
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.82),
                SizedBox(height: SizeConfig.screenHeight * 0.2),
                shimmerContainer(
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.82),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shimmerContainer({required double height, required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.withOpacity(0.5),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/components/searchable_dropdown.dart';
import 'package:flutter_application_1/Screens/admin/routine/add_routine.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';

class AdminRoutine extends StatefulWidget {
  const AdminRoutine({super.key});

  @override
  State<AdminRoutine> createState() => _AdminRoutineState();
}

class _AdminRoutineState extends State<AdminRoutine> {
  TextEditingController routineController = TextEditingController();
  int expandedIndex = -1;
  String nameMuscleGroup = 'Espalda';
  String routineDelete = '';

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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: 'Rutina',
          colorText: Colors.white,
          automaticallyImplyLeading: false,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: context
                .read<ProviderService>()
                .providerGetAdminAndGymData(), // Carga inicial de los ejercicios
            builder: (context, snapshot) {
              if (context.read<ProviderService>().adminGymData == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Stack(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.104,
                        ),
                        child: Container(
                          height: SizeConfig.screenHeight * 0.20,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 52, 72, 100),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: SizeConfig.screenHeight * 0.0223),
                            lineTextFormField(
                              routineController,
                              hintText: 'Nombre de la rutina:',
                              colorHintText: Colors.white,
                              colorText: Colors.white,
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.0223),
                            Center(
                              child: CustomButton(
                                width: SizeConfig.screenWidth * 0.35,
                                color: const Color(0xFF246B84),
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * 0.02,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.screenWidth * 0.02)),
                                alignment: Alignment.center,
                                text: "Crear Rutina",
                                textColor: Colors.white,
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddRoutine(
                                          nameRoutine: routineController.text),
                                    ),
                                  ).then((_) {
                                    routineController.clear();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(height: SizeConfig.screenHeight * 0.0223),
                    Stack(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.104,
                        ),
                        child: Container(
                          height: SizeConfig.screenHeight * 0.20,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 52, 72, 100),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: SizeConfig.screenHeight * 0.0223),
                            SearchableDropdown(
                              items: context
                                  .watch<ProviderService>()
                                  .adminGymData!['gym']
                                  .routines,
                              hintText: 'Seleccionar rutina',
                              onItemSelected: (selectedItem) {
                                routineDelete = selectedItem;
                              },
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.0223),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  color: const Color(0xFF246B84),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.screenWidth * 0.04),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7)),
                                  alignment: Alignment.center,
                                  text: "Modificar",
                                  textColor: Colors.white,
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddRoutine(
                                            nameRoutine:
                                                routineController.text),
                                      ),
                                    );
                                    setState(() {
                                      routineController.clear();
                                    });
                                  },
                                ),
                                SizedBox(
                                    width: SizeConfig.screenWidth * 0.0223),
                                CustomButton(
                                  color: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.screenWidth * 0.04),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7)),
                                  alignment: Alignment.center,
                                  text: "Eliminar",
                                  textColor: Colors.white,
                                  press: () {
                                    context
                                        .read<ProviderService>()
                                        .providerDeleteRoutine(routineDelete);
                                    setState(() {
                                      context
                                          .read<ProviderService>()
                                          .searchController
                                          .clear();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(width: SizeConfig.screenWidth * 0.0223),
                    SizedBox(height: SizeConfig.screenHeight * 0.3),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

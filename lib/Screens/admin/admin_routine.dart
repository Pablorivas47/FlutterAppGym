import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/components/exercises_card.dart';
import 'package:flutter_application_1/Screens/admin/components/filter_exercises.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';

class AdminRoutine extends StatefulWidget {
  const AdminRoutine({super.key});

  @override
  State<AdminRoutine> createState() => _AdminRoutineState();
}

class _AdminRoutineState extends State<AdminRoutine> {
  TextEditingController filterController = TextEditingController();
  int expandedIndex = -1;
  int selectedExercise = 0;

  @override
  void initState() {
    super.initState();

    // Escuchar cambios en el filtro
    filterController.addListener(() {
      // Llama al método del provider para filtrar ejercicios
      context.read<ProviderService>().providerGetFilteredExercises(
          filterController.text,
          selectedExercise); // Asegúrate de pasar el selectedExercise
    });
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
          text: 'Rutina',
          colorText: Colors.white,
          automaticallyImplyLeading: false,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * 0.05,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.104,
                    ),
                    child: personalizeTextFormField(
                      filterController,
                      filled: true,
                      fillColor: Colors.white,
                      colorHintText: Colors.black,
                      colorIcon: Colors.black,
                      hintText: "Buscar",
                      icon: Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                        size: SizeConfig.screenHeight * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                  FilterExercises(
                    onFilterSelected: (int selected) {
                      setState(() {
                        selectedExercise = selected;
                        filterController.clear();
                        // Llama al método de filtrado después de seleccionar un nuevo grupo
                        context
                            .read<ProviderService>()
                            .providerGetFilteredExercises(filterController.text,
                                selected); // Pasa el nuevo grupo
                      });
                    },
                    exercisesData:
                        context.read<ProviderService>().exercisesData,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.0223),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.104,
                    ),
                    child: SizedBox(
                      height: SizeConfig.screenHeight * 0.2,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 2,
                          mainAxisSpacing: SizeConfig.screenWidth * 0.075,
                        ),
                        itemCount: context
                            .watch<ProviderService>()
                            .filteredExercises
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return ExercisesCard(
                            name: context
                                .watch<ProviderService>()
                                .filteredExercises[index],
                            onTap: () {
                              setState(() {
                                expandedIndex =
                                    (expandedIndex == index) ? -1 : index;
                              });
                            },
                            isSelected: expandedIndex == index,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

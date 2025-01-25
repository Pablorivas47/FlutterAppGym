import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/routine/components/add_exercises.dart';
import 'package:flutter_application_1/Screens/admin/components/exercises_card.dart';
import 'package:flutter_application_1/Screens/admin/routine/components/filter_exercises.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';

class AddRoutine extends StatefulWidget {
  final String nameRoutine;
  const AddRoutine({super.key, required this.nameRoutine});

  @override
  State<AddRoutine> createState() => _AddRoutineState();
}

class _AddRoutineState extends State<AddRoutine> {
  int expandedIndex = -1;
  String nameMuscleGroup = 'Espalda';

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
          text: 'Rutina: ${widget.nameRoutine}',
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
        body: FutureBuilder(
          future: context
              .read<ProviderService>()
              .providerGetFilteredExercises(), // Carga inicial de los ejercicios
          builder: (context, snapshot) {
            if (context.read<ProviderService>().exercisesData == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.104,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: SizeConfig.screenHeight * 0.0223),
                          personalizeTextFormField(
                            context
                                .watch<ProviderService>()
                                .filterExercisesController,
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
                          SizedBox(height: SizeConfig.screenHeight * 0.0223),
                          FilterExercises(
                            onFilterSelectedString: (String muscleGroup) {
                              nameMuscleGroup = muscleGroup;
                            },
                            onFilterSelected: (int selected) {
                              setState(() {
                                // Actualizamos el valor seleccionado en el Provider
                                context
                                    .read<ProviderService>()
                                    .setSelectedExercise(selected);
                                context
                                    .read<ProviderService>()
                                    .filterExercisesController
                                    .clear();
                                context
                                    .read<ProviderService>()
                                    .providerGetFilteredExercises();

                                expandedIndex = -1;
                              });
                            },
                            exercisesData:
                                context.read<ProviderService>().exercisesData,
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.0223),
                        ],
                      ),
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
                        if (expandedIndex != -1)
                          AddExercises(
                            expandedIndex: expandedIndex,
                            nameMuscleGroup: nameMuscleGroup,
                            name: context
                                .watch<ProviderService>()
                                .filteredExercises[expandedIndex],
                            nameRoutine: widget.nameRoutine,
                          ),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

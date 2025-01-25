import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/provider.dart';
import 'package:flutter_application_1/components/custom_button.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/increment_decrement.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:provider/provider.dart';

class AddExercises extends StatefulWidget {
  final int _expandedIndex;
  final String name;
  final String nameMuscleGroup;
  final String nameRoutine;

  const AddExercises({
    super.key,
    required int expandedIndex,
    required this.name,
    required this.nameMuscleGroup,
    required this.nameRoutine,
  }) : _expandedIndex = expandedIndex;

  @override
  State<AddExercises> createState() => _AddExercisesState();
}

class _AddExercisesState extends State<AddExercises> {
  TextEditingController repetitionsController = TextEditingController();
  TextEditingController seriesController = TextEditingController();
  TextEditingController observationsController = TextEditingController();

  int repetitions = 0;
  int series = 0;
  String nameMuscleGroup = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget._expandedIndex != -1
          ? AnimatedContainer(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 52, 72, 100),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white)),
              duration: const Duration(milliseconds: 100),
              width: SizeConfig.screenWidth * 0.8,
              height: widget._expandedIndex != -1
                  ? SizeConfig.screenHeight *
                      0.45 // Incrementa el tamaño dinámico según el contenido
                  : 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.09,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: SizeConfig.screenHeight * 0.03,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0223),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncrementDecrementButton(
                          name: 'Repeticiones:',
                          onCountChanged: (int newRepetitions) {
                            setState(() {
                              repetitions = newRepetitions;
                            });
                          },
                          initialCount: 0,
                        ),
                        SizedBox(width: SizeConfig.screenHeight * 0.0175),
                        IncrementDecrementButton(
                          name: 'Serie:',
                          onCountChanged: (int newSeries) {
                            setState(() {
                              repetitions = newSeries;
                            });
                          },
                          initialCount: 0,
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0223),
                    customTextFormField(
                      observationsController,
                      hintText: "Observaciones",
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.0323),
                    Center(
                      child: CustomButton(
                        width: SizeConfig.screenWidth * 0.45,
                        color: const Color(0xFF246B84),
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.screenWidth * 0.02)),
                        alignment: Alignment.center,
                        text: "Agregar ejercicio",
                        textColor: Colors.white,
                        press: () {
                          context
                              .read<ProviderService>()
                              .providerAddLoadedRoutine(
                                widget.nameRoutine,
                                widget.name,
                                repetitions,
                                series,
                                observationsController.text,
                                widget.nameMuscleGroup,
                              );
                          widget._expandedIndex == -1;
                        },
                        padding: null,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}

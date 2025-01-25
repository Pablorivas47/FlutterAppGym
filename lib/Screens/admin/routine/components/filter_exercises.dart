import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class FilterExercises extends StatefulWidget {
  final List<dynamic>? exercisesData; // Recibe la lista de ejercicios
  final Function(int)? onFilterSelected;
  final Function(String)? onFilterSelectedString;

  const FilterExercises({
    super.key,
    this.exercisesData,
    this.onFilterSelected,
    this.onFilterSelectedString,
  });

  @override
  State<FilterExercises> createState() => _FilterExercisesState();
}

class _FilterExercisesState extends State<FilterExercises> {
  int selectedIndex = 0; // Inicializa con un índice seleccionado

  // Función para manejar el cambio de filtro
  void onFilterSelected(int index) {
    setState(() {
      selectedIndex = index; // Guarda el índice seleccionado
    });

    // Llama al callback si está definido y devuelve el índice seleccionado
    widget.onFilterSelected?.call(index);

    // Llama al callback si está definido y devuelve el nombre del ejercicio seleccionado
    if (widget.onFilterSelectedString != null && widget.exercisesData != null) {
      String selectedExerciseName = widget.exercisesData![index].name;
      widget.onFilterSelectedString!(selectedExerciseName);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Si exercisesData es nulo o está vacío, retornar un widget vacío
    if (widget.exercisesData == null || widget.exercisesData!.isEmpty) {
      return Container(); // Retorna un contenedor vacío si no hay datos
    }

    return SizedBox(
      height: SizeConfig.screenHeight * 0.025, // Altura fija para el ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // ListView en horizontal
        itemCount: widget.exercisesData!.length,
        itemBuilder: (context, index) {
          // Obtener el nombre del ejercicio actual
          String filterName = widget.exercisesData![index].name;
          bool isSelected = index ==
              selectedIndex; // Verifica si este índice está seleccionado

          return GestureDetector(
            onTap: () {
              onFilterSelected(index); // Llama a la función pasando el índice
            },
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.01),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(255, 252, 17, 0)
                    : Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.035,
                ),
                child: Center(
                  child: Text(
                    filterName,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.screenHeight * 0.0125,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

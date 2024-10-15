import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class FilterExercises extends StatefulWidget {
  final List<dynamic>? exercisesData; // Recibe la lista de ejercicios
  final Function(int)?
      onFilterSelected; // Cambia el tipo de callback para devolver el índice

  const FilterExercises({super.key, this.exercisesData, this.onFilterSelected});

  @override
  State<FilterExercises> createState() => _FilterExercisesState();
}

class _FilterExercisesState extends State<FilterExercises> {
  int selectedIndex = 0; // Inicializa sin un filtro seleccionado

  // Función para manejar el cambio de filtro
  void onFilterSelected(int index) {
    setState(() {
      selectedIndex = index; // Guarda el índice seleccionado
    });

    // Llama al callback si está definido
    if (widget.onFilterSelected != null) {
      widget.onFilterSelected!(index); // Devuelve el índice seleccionado
    }
  }

  @override
  Widget build(BuildContext context) {
    // Si exercisesData es nulo o está vacío, retornar un widget vacío
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.104),
      child: SizedBox(
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
      ),
    );
  }
}

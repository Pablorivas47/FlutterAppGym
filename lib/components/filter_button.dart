import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  List<String> filters = ['Todos', 'Precio', 'Ubicacion', 'Puntuacion'];
  String selectedFilter = 'Todos';

  // Función para manejar el cambio de filtro
  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.104),
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.025, // Altura fija para el ListView
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // ListView en horizontal
          itemCount: filters.length,
          itemBuilder: (context, index) {
            String filter = filters[index];
            bool isSelected = filter == selectedFilter;
            return GestureDetector(
              onTap: () {
                onFilterSelected(filter);
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
                      filter,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.screenHeight * 0.0125),
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

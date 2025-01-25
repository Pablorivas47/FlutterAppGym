import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class FilterButton extends StatefulWidget {
  final Function(String)? onFilterSelected; // Cambia el tipo a String
  final Function(String)? onActivitySelected; // Agrega esta función
  final List<String> activities;

  const FilterButton(
      {super.key,
      this.onFilterSelected,
      this.onActivitySelected,
      required this.activities});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  //List<String> filters = ['Todos', 'Crossfit', 'Musculacion', 'Personalizado'];
  String selectedFilter = 'Todos';

  void onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
      widget.onFilterSelected?.call(filter); // Llama la función pasada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.104),
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.025,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.activities.length,
          itemBuilder: (context, index) {
            String filter = widget.activities[index];
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
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.035),
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

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

// ignore: must_be_immutable
class ChoiseRutine extends StatefulWidget {
  TextEditingController genderController;

  ChoiseRutine({
    super.key,
    required this.genderController,
  });

  @override
  State<ChoiseRutine> createState() => _ChoiseRutineState();
}

// ignore: camel_case_types
enum gender {
  m('Pablo h1'),
  f('Fer h2'),
  p('Fer h3'),
  n('Fer h4');

  const gender(
    this.label,
  );
  final String label;
}

class _ChoiseRutineState extends State<ChoiseRutine> {
  gender? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<gender>(
      controller: widget.genderController,
      initialSelection: selectedValue,
      width: SizeConfig.screenWidth * 0.625,
      onSelected: (
        gender? newValue,
      ) {
        setState(() {
          selectedValue = newValue;
        });
      },
      label: selectedValue == null
          ? Text(
              'Rutinas:',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontSize: SizeConfig.screenHeight * 0.02,
                fontWeight: FontWeight.w300,
              ),
            )
          : null, // Oculta el label si hay una selección
      inputDecorationTheme: const InputDecorationTheme(
        filled: false,
        suffixIconColor: Colors.white,
      ),
      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w300,
        fontSize: SizeConfig.screenWidth * 0.04,
      ),
      menuStyle: const MenuStyle(
        surfaceTintColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor:
            WidgetStatePropertyAll(Color.fromARGB(246, 253, 136, 136)),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      dropdownMenuEntries: gender.values
          .map<DropdownMenuEntry<gender>>((gender genderSelection) {
        return DropdownMenuEntry<gender>(
          value: genderSelection,
          label: genderSelection.label,
          style: MenuItemButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor:
                selectedValue == genderSelection ? Colors.white : Colors.black,
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: SizeConfig.screenWidth * 0.03,
            ),
          ),
        );
      }).toList(),
    );
  }
}

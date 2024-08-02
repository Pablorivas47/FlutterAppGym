

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

// ignore: must_be_immutable
class CustomDropdownMenu extends StatefulWidget {
  TextEditingController genderController;

  
  CustomDropdownMenu({
    super.key, 
    required this.genderController,

    });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}
// ignore: camel_case_types
enum gender {
  m('Masculino'),
  f('Femenino'),
  p('Prefiero no decirlo'),
  n('No binario');
  const gender(this.label,);
  final String label;
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  
  gender? selectedValue;

  @override
  Widget build(BuildContext context) {
    return  DropdownMenu<gender>(

      controller: widget.genderController,
      
      initialSelection:selectedValue,
      width: SizeConfig.screenWidth*0.825,
    
      onSelected: (gender? newValue, ) {
        setState(() {
          selectedValue = newValue;
        });
      },

      label: Text(
        'Sexo:',
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Inter",
          fontSize: SizeConfig.screenHeight*0.02,
          fontWeight: FontWeight.w300,
      ),
        ),

      inputDecorationTheme: InputDecorationTheme(

        filled: false,
        suffixIconColor: const Color.fromARGB(255, 238, 199, 199),


        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.screenWidth*0.02),
          borderSide: const BorderSide(
            color: Colors.white70,
          )
        ),
      ),

      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w300,
        fontSize: SizeConfig.screenWidth*0.04,
      ),

      menuStyle: const  MenuStyle(
        surfaceTintColor:  WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(Color.fromARGB(246, 253, 136, 136)),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),

      dropdownMenuEntries: gender.values.map<DropdownMenuEntry<gender>>(
        (gender genderSelection) {
        return DropdownMenuEntry<gender>(
          value: genderSelection,
          label: genderSelection.label,
          style: MenuItemButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: selectedValue == genderSelection ? Colors.white : Colors.black,
            textStyle: TextStyle(
              color: Colors.white,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: SizeConfig.screenWidth*0.03,
      ),
          ),
        );
      }).toList(),
      
    );
  }
}




import 'package:flutter/material.dart';

// ignore: camel_case_types
class customRadioButton extends StatefulWidget {
  const customRadioButton({super.key});

  @override
  State<customRadioButton> createState() => customRadioButtonState();
}

// ignore: constant_identifier_names


// ignore: camel_case_types
class customRadioButtonState extends State<customRadioButton> {
  
  String selectedValue = 'Masculino';
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Masculino'),
          leading: Radio<String>(
            value: 'Masculino',
            groupValue: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Femenino'),
          leading: Radio<String>(
            value: 'Femenino',
            groupValue: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Prefiero no decirlo'),
          leading: Radio<String>(
            value: 'Prefiero no decirlo',
            groupValue: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Personalizado'),
          leading: Radio<String>(
            value: 'Personalizado',
            groupValue: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
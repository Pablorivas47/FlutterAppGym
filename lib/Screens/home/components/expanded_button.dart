import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({Key? key}) : super(key: key);

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool _isExpanded = false; // Controla si el widget está expandido o no

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded =
                    !_isExpanded; // Alterna entre expandido y colapsado
              });
            },
            child: Text(_isExpanded ? "Colapsar" : "Expandir"),
          ),
          //const SizedBox(height: 16.0),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isExpanded
                ? SizeConfig.screenHeight * 0.09
                : 0.0, // Controla el tamaño
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isExpanded ? 1.0 : 0.0, // Controla la opacidad
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.blue[100],
                child: const Text(
                  'Este es el contenido expandible.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

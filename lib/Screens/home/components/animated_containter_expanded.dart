import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';
import 'package:flutter_application_1/objetos/activity.dart';

class AnimatedContainerExpanded extends StatefulWidget {
  final int _expandedIndex;
  final Activity activity;

  const AnimatedContainerExpanded({
    super.key,
    required int expandedIndex,
    required this.activity,
  }) : _expandedIndex = expandedIndex;

  @override
  State<AnimatedContainerExpanded> createState() =>
      _AnimatedContainerExpandedState();
}

class _AnimatedContainerExpandedState extends State<AnimatedContainerExpanded> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.104,
      ),
      child: widget._expandedIndex != -1
          ? AnimatedContainer(
              color: Colors.transparent,
              duration: const Duration(milliseconds: 100),
              height: widget._expandedIndex != -1
                  ? SizeConfig.screenHeight *
                      0.11 *
                      widget.activity.price
                          .length // Incrementa el tamaño dinámico según el contenido
                  : 0,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.activity.price.length,
                itemBuilder: (context, index) {
                  String key = widget.activity.price.keys.elementAt(index);
                  List<dynamic> values = widget.activity.price[key]!;
                  // Contenedor para cada entrada
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.screenWidth * 0.02,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * 0.04,
                        vertical: SizeConfig.screenWidth * 0.04,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), // Bordes redondeados
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dias: ${values.first}"),
                            Text("Precio: \$${values[1].toString()}")
                          ]),
                    ),
                  );
                },
              ),
            )
          : null,
    );
  }
}

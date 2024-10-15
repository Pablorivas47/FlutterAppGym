import 'package:flutter/cupertino.dart';
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
    return Container(
      child: widget._expandedIndex != -1
          ? AnimatedContainer(
              color: Colors.transparent,
              duration: const Duration(milliseconds: 100),
              width: SizeConfig.screenWidth * 0.8,
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/paymentMethods');
                    },
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dias: ${values.first}"),
                                Text("Precio: \$${values[1].toString()}")
                              ]),
                          Icon(
                            CupertinoIcons
                                .rectangle_fill_on_rectangle_angled_fill,
                            color: Colors
                                .pink, // Cambia el color según sea necesario
                            size: SizeConfig.screenWidth * 0.075,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : null,
    );
  }
}

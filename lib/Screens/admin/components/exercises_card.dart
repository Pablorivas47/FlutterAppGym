import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class ExercisesCard extends StatefulWidget {
  final Function()? onTap;
  final String name;
  final bool isSelected;

  const ExercisesCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.isSelected,
  });

  @override
  State<ExercisesCard> createState() => _ExercisesCardState();
}

class _ExercisesCardState extends State<ExercisesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          duration: const Duration(milliseconds: 100),
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth * 1,
                height: SizeConfig.screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: widget.isSelected ? Colors.pink : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.isSelected ? Colors.pink : Colors.white,
                  ),
                  boxShadow: widget.isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(1.5, 1.5),
                            blurRadius: 5,
                            blurStyle: BlurStyle.solid,
                          ),
                        ]
                      : [],
                ),
                child: widget.isSelected
                    ? Image.asset(
                        "assets/icons/w-white.png",
                        fit: BoxFit.none,
                        scale: SizeConfig.screenHeight * 0.06,
                      )
                    : Image.asset(
                        "assets/icons/w-black.png",
                        fit: BoxFit.none,
                        scale: SizeConfig.screenHeight * 0.06,
                      ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.0125,
              ),
              Row(
                children: [
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3, // Máximo 2 líneas para el nombre
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter",
                          fontSize: SizeConfig.screenHeight * 0.0135,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.plus_app,
                    color: Colors.white,
                    size: SizeConfig.screenHeight * 0.02,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

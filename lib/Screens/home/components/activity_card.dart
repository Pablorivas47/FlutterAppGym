import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

class ActivityCard extends StatefulWidget {
  final Function()? onTap;
  final String name;
  final bool isSelected;

  const ActivityCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.isSelected,
  });

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
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
                child: Icon(
                  CupertinoIcons.game_controller_solid,
                  color: widget.isSelected ? Colors.white : Colors.black,
                  size: SizeConfig.screenHeight * 0.05,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.0125,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: SizeConfig.screenHeight * 0.0125,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/size_config.dart';

// ignore: must_be_immutable
class IncrementDecrementButton extends StatefulWidget {
  final String name;
  final ValueChanged<int> onCountChanged;
  final int initialCount;

  const IncrementDecrementButton({
    super.key,
    required this.name,
    required this.onCountChanged,
    required this.initialCount,
  });

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void increment() {
    setState(() {
      if (count < 99) {
        count++;
      } else {
        count = 0; // Resetea a 0 cuando llega a 99
      }
      widget.onCountChanged(count); // Notifica el cambio de count
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      } else {
        count = 99; // Pasa a 99 cuando intenta decrementar desde 0
      }
      widget.onCountChanged(count); // Notifica el cambio de count
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: const TextStyle(color: Colors.white),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.01),
        Container(
          height: SizeConfig.screenWidth * 0.1,
          width: SizeConfig.screenWidth * 0.285,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.minus,
                      color: Colors.red, size: SizeConfig.screenHeight * 0.015),
                  onPressed: decrement,
                ),
                Text(
                  count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.screenHeight * 0.015,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.add,
                      color: Colors.red, size: SizeConfig.screenHeight * 0.015),
                  onPressed: increment,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

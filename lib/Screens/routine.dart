import 'package:flutter/material.dart';


class Routine extends StatelessWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
          )
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body:Center(
          child: Text(
            "Rutina", 
            style: TextStyle(
              color: Colors.white
            ))
        ),
      ),
    );
  }
}
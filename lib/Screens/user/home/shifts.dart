import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';

class Shifts extends StatefulWidget {
  const Shifts({super.key});

  @override
  State<Shifts> createState() => _ShiftsState();
}

class _ShiftsState extends State<Shifts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
      )),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          text: "Turnos",
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

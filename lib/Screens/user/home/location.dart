import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/google_maps.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';

class LocationMaps extends StatefulWidget {
  const LocationMaps({super.key});

  @override
  State<LocationMaps> createState() => _LocationMapsState();
}

class _LocationMapsState extends State<LocationMaps> {
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
          text: "Ubicacion",
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
        body: GoogleMaps(),
      ),
    );
  }
}

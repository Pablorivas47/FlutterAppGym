import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/google_maps.dart';
import 'package:flutter_application_1/components/custom_app_bar.dart';

class LocationMaps extends StatelessWidget {
  final double latitude;
  final double longitude;
  const LocationMaps(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/image/Fondo_Sing_In.jpg"),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          text: "Ubicacion",
          colorText: Colors.white,
          automaticallyImplyLeading: true,
          padding: EdgeInsets.zero,
        ),
        body: GoogleMaps(
          latitude: latitude,
          longitude: longitude,
        ),
      ),
    );
  }
}

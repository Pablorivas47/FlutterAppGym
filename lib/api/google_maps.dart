import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/components/map_style_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  final _controller = MapStyleController();
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-37.310430, -59.139790),
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: GoogleMap(
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        compassEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: _controller.onMapCreated,
      ),
    );
  }
}

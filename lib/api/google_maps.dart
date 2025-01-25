import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/components/map_style_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  final double latitude;
  final double longitude;
  const GoogleMaps(
      {super.key, required this.latitude, required this.longitude});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  final _controller = MapStyleController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 15,
        ),
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        compassEnabled: false,
        trafficEnabled: true,
        onMapCreated: _controller.onMapCreated,
        markers: {
          Marker(
            markerId:
                MarkerId(LatLng(widget.latitude, widget.longitude).toString()),
            position: LatLng(widget.latitude, widget.longitude),
          ),
        },
      ),
    );
  }
}

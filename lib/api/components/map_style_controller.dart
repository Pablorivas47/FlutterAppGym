import 'package:flutter_application_1/api/components/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapStyleController {
  void onMapCreated(GoogleMapController controller) {
    // ignore: deprecated_member_use
    controller.setMapStyle(mapStyle);
  }
}

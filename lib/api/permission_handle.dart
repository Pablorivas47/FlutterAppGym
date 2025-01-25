import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionHandler {
  static Future<Position?> requestPermissionAndGetLocation(
      BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    // Caso: el permiso no se ha otorgado
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // El usuario sigue negando el permiso
        return null;
      }
    }

    // Caso: el permiso está denegado permanentemente
    if (permission == LocationPermission.deniedForever) {
      _showPermissionDialog(context);
      return null;
    }

    // Caso: el permiso está otorgado
    return await Geolocator.getCurrentPosition();
  }

  // Muestra un diálogo para redirigir al usuario a la configuración
  static void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permiso necesario"),
        content: const Text(
            "El permiso de ubicación está bloqueado. Habilítalo desde la configuración."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Geolocator.openAppSettings(); // Abre la configuración
            },
            child: const Text("Abrir configuración"),
          ),
        ],
      ),
    );
  }
}

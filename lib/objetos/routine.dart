import 'package:cloud_firestore/cloud_firestore.dart';

class Routine {
  String nameRoutine;
  final Map<String, List<Map<String, dynamic>>> muscleGroups;
  Timestamp? createdRoutine;

  Routine({
    required this.nameRoutine,
    required this.muscleGroups,
    required this.createdRoutine,
  });

  static Future<Routine> fromFirestoreRoutine(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Map<String, List<Map<String, dynamic>>> muscleGroupsMap = {};

    if (data['muscleGroups'] != null) {
      data['muscleGroups'].forEach((key, value) {
        // Asegura que cada entrada de 'muscleGroups' sea una lista de mapas.
        muscleGroupsMap[key] = List<Map<String, dynamic>>.from(
          value.map((item) => Map<String, dynamic>.from(item)),
        );
      });
    }

    return Routine(
      nameRoutine: data['nameRoutine'] ?? '',
      muscleGroups: muscleGroupsMap,
      createdRoutine: data['createdAt'],
    );
  }
}

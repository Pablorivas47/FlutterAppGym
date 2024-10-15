import 'package:cloud_firestore/cloud_firestore.dart';

class Exercises {
  String name;
  final List<dynamic> exercises;

  Exercises({
    required this.name,
    required this.exercises,
  });

  static Future<Exercises> fromFirestoreAct(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    List<String> exercises = List<String>.from(data['exercises']);

    return Exercises(
      name: data['name'],
      exercises: exercises,
    );
  }

  toLowerCase() {}
}

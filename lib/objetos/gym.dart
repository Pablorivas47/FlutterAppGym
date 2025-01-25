import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/objetos/activity.dart';
import 'package:flutter_application_1/objetos/routine.dart';

class Gym {
  String name;
  String description;
  List<String> images;
  String logo;
  num phoneNumber;
  List<Activity> activities;
  List<Routine> routines;

  Gym(
      {required this.name,
      required this.description,
      required this.images,
      required this.logo,
      required this.phoneNumber,
      required this.activities,
      required this.routines});

  static Future<Gym> fromFirestoreGym(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    List<String> images = List<String>.from(data['images']);

    return Gym(
      name: data['name'],
      description: data['description'],
      logo: data['logo'],
      images: images,
      phoneNumber: data['phoneNumber'],
      activities: [],
      routines: [],
    );
  }

  void addActivities(List<Activity> activities) {
    this.activities.addAll(activities);
  }

  void addRoutines(List<Routine> routines) {
    this.routines.addAll(routines);
  }
}

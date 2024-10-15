import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/objetos/activity.dart';

class Gym {
  String name;
  String description;
  List<String> images;
  String logo;
  num phoneNumber;
  List<Activity> activities;

  Gym(
      {required this.name,
      required this.description,
      required this.images,
      required this.logo,
      required this.phoneNumber,
      required this.activities});

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
    );
  }

  void addActivities(List<Activity> activities) {
    this.activities.addAll(activities);
  }
}

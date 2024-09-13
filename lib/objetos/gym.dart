import 'package:cloud_firestore/cloud_firestore.dart';

class Gym {
  String name;
  String uid;
  String description;
  List<String> images;

  Gym({
    required this.name,
    required this.uid,
    required this.description,
    required this.images,
  });

  static Future<Gym> fromFirestoreGym(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    List<String> images = List<String>.from(data['images']);

    return Gym(
      name: data['name'],
      uid: data['uid'],
      description: data['description'],
      images: images,
    );
  }
}

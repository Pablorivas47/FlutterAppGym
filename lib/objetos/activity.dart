import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  String name;
  final Map<String, List<dynamic>> price;

  Activity({
    required this.name,
    required this.price,
  });

  static Future<Activity> fromFirestoreAct(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Map<String, List<dynamic>> priceMap = {};

    if (data['price'] != null) {
      data['price'].forEach((key, value) {
        priceMap[key] =
            List<dynamic>.from(value); // Asegura que sea una List<dynamic>
      });
    }

    return Activity(
      name: data['name'],
      price: priceMap,
    );
  }
}

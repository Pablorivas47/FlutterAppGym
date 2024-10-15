import 'package:cloud_firestore/cloud_firestore.dart';

class IAdmin {
  String email;
  String role;
  String? club;

  IAdmin({
    required this.email,
    required this.role,
    this.club,
  });

  static Future<IAdmin> fromFirestore(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return IAdmin(
      email: data['email'],
      role: data['role'],
      club: data['club'],
    );
  }
}

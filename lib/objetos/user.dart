import 'package:cloud_firestore/cloud_firestore.dart';

class IUser {
  String email;
  String name;
  String numberPhone;
  String nickName;
  String gender;
  Timestamp? expirationDate;
  Timestamp? paymentDate;
  num? amount;
  GeoPoint? location;

  IUser({
    required this.email,
    required this.name,
    required this.numberPhone,
    required this.nickName,
    required this.gender,
    this.expirationDate,
    this.paymentDate,
    this.amount,
    this.location,
  });

  static Future<IUser> fromFirestore(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return IUser(
      email: data['email'],
      name: data['name'],
      numberPhone: data['phoneNumber'],
      nickName: data['nickName'],
      gender: data['gender'],
      expirationDate: data['expirationDate'],
      paymentDate: data['paymentDate'],
      amount: data['amount'],
      location: data['location'],
    );
  }
}

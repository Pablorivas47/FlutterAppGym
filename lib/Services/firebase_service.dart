import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/objetos/activity.dart';
import 'package:flutter_application_1/objetos/gym.dart';
import 'package:flutter_application_1/objetos/user.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//---------------------------   User  ---------------------------

Future<IUser> getUserData() async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('people')
      .doc(currentUser.uid)
      .get();

  IUser user = await IUser.fromFirestore(snapshot);
  return user;
}

Future<void> updateIUser(String? phoneNumber) async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  await db.collection("people").doc(currentUser.uid).update({
    "phoneNumber": phoneNumber,
  });
}

//---------------------------   Gym  ---------------------------

Future<List<Gym>> getGymData() async {
  List<Gym> gyms = [];

  CollectionReference collectionReferenceGyms = db.collection('gimnasios');
  QuerySnapshot queryGyms = await collectionReferenceGyms.get();
  for (var documento in queryGyms.docs) {
    gyms.add(await Gym.fromFirestoreGym(documento));
  }

  return gyms;
}

Future<List<Activity>> getGymDataPointActivity(String uidGym) async {
  List<Activity> activities = [];
  CollectionReference collectionReferenceGyms =
      db.collection('gimnasios').doc(uidGym).collection('Activity');
  QuerySnapshot snapshot = await collectionReferenceGyms.get();
  for (var doc in snapshot.docs) {
    activities.add(await Activity.fromFirestoreAct(doc));
  }
  return activities;
}

//---------------------------   Auth  ---------------------------

Future<void> saveEmailPasswordUser(String uid, String displayName,
    String nickName, String email, String gender, String phoneNumber) async {
  await db.collection('people').doc(uid).set({
    'name': displayName,
    'nickName': nickName,
    'email': email,
    'gender': gender,
    'phoneNumber': phoneNumber,
  });
}

//---------------------------   Payments  ---------------------------

Future<void> updateHandlePayments(num amount) async {
  User user = FirebaseAuth.instance.currentUser!;
  final paymentDate = Timestamp.now();
  final expirationDate = Timestamp.fromDate(paymentDate
      .toDate()
      .add(const Duration(days: 30))); // 30 días desde la fecha de pago

  final docRef = FirebaseFirestore.instance.collection('people').doc(user.uid);
  final docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    //El documento existe, actualiza el documento
    await docRef.update({
      'amount': amount,
      'paymentDate': paymentDate,
      'expirationDate': expirationDate,
    });
  } else {
    // El documento no existe, crea un nuevo documento
    await docRef.set({
      'amount': amount,
      'paymentDate': paymentDate,
      'expirationDate': expirationDate,
    });
  }
}

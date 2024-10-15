import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/objetos/activity.dart';
import 'package:flutter_application_1/objetos/admin.dart';
import 'package:flutter_application_1/objetos/exercises.dart';
import 'package:flutter_application_1/objetos/gym.dart';
import 'package:flutter_application_1/objetos/user.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
//---------------------------   Admin  ---------------------------
Future<Map<String, dynamic>?> getAdminAndGymData() async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
      .collection('admins')
      .doc(currentUser.uid)
      .get();

  IAdmin admin = await IAdmin.fromFirestore(adminSnapshot);
  DocumentSnapshot gymSnapshot = await FirebaseFirestore.instance
      .collection('gimnasios')
      .doc(admin.club)
      .get();

  Gym gym = await Gym.fromFirestoreGym(gymSnapshot);
  return {
    'admin': admin,
    'gym': gym,
  };
}

// Verificamos si el usuario es admin
Future<bool> isAdmin(String uid) async {
  var adminDoc =
      await FirebaseFirestore.instance.collection('admins').doc(uid).get();
  return adminDoc.exists && adminDoc.data()?['role'] == 'admin';
}

//---------------------------   User  ---------------------------

Future<IUser> getUserData() async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.uid)
      .get();

  IUser user = await IUser.fromFirestore(snapshot);
  return user;
}

Future<void> updateIUser(String? phoneNumber) async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  await db.collection("users").doc(currentUser.uid).update({
    "phoneNumber": phoneNumber,
  });
}

// Verificamos si el usuario es user
Future<bool> isUser(String uid) async {
  var userDoc =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
  return userDoc.exists && userDoc.data()?['role'] == 'user';
}

//---------------------------   Gyms  ---------------------------
Future<List<Gym>> getGymsAndActivities() async {
  List<Gym> gyms = [];
  CollectionReference gymsCollection = db.collection('gimnasios');
  QuerySnapshot gymsSnapshot = await gymsCollection.get();

  for (var gymDoc in gymsSnapshot.docs) {
    Gym gym = await Gym.fromFirestoreGym(gymDoc);
    String gymId = gymDoc.id;
    // Obtener la subcolección de actividades para el gimnasio actual
    List<Activity> activities = [];
    CollectionReference activitiesCollection =
        gymsCollection.doc(gymId).collection('Activity');
    QuerySnapshot activitiesSnapshot = await activitiesCollection.get();

    // Iterar sobre las actividades y convertir cada documento en un objeto Activity
    for (var activityDoc in activitiesSnapshot.docs) {
      Activity activity = await Activity.fromFirestoreAct(activityDoc);
      activities.add(activity);
    }

    // Agregar las actividades al objeto gym
    gym.addActivities(activities);

    gyms.add(gym);
  }

  return gyms;
}

//---------------------------   Exercises  ---------------------------

Future<List<Exercises>> getExercises() async {
  List<Exercises> exercisesList = [];

  // Referencia a la colección 'exercises'
  CollectionReference exercisesCollection = db.collection('exerciseTemplates');
  QuerySnapshot exercisesSnapshot = await exercisesCollection.get();

  // Iterar sobre los documentos de la colección
  for (var doc in exercisesSnapshot.docs) {
    // Convertir el documento en un objeto Exercises usando fromFirestoreAct
    Exercises exercise = await Exercises.fromFirestoreAct(doc);

    // Agregar el ejercicio a la lista
    exercisesList.add(exercise);
  }

  return exercisesList;
}

//---------------------------   Auth  ---------------------------

Future<void> saveEmailPasswordUser(String uid, String displayName,
    String nickName, String email, String gender, String phoneNumber) async {
  await db.collection('users').doc(uid).set({
    'name': displayName,
    'nickName': nickName,
    'email': email,
    'gender': gender,
    'phoneNumber': phoneNumber,
    'role': 'user',
  });
}

//---------------------------   Payments  ---------------------------

Future<void> updateHandlePayments(num amount) async {
  User user = FirebaseAuth.instance.currentUser!;
  final paymentDate = Timestamp.now();
  final expirationDate = Timestamp.fromDate(paymentDate
      .toDate()
      .add(const Duration(days: 30))); // 30 días desde la fecha de pago

  final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
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

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/objetos/activity.dart';
import 'package:flutter_application_1/objetos/admin.dart';
import 'package:flutter_application_1/objetos/exercises.dart';
import 'package:flutter_application_1/objetos/gym.dart';
import 'package:flutter_application_1/objetos/routine.dart';
import 'package:flutter_application_1/objetos/user.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
//---------------------------   Admin  ---------------------------

Future<Map<String, dynamic>?> getAdminAndGymData() async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  // Obtener el documento del administrador usando su UID
  DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
      .collection('admins')
      .doc(currentUser.uid)
      .get();

  // Convertir el documento de admin a un objeto de tipo IAdmin
  IAdmin admin = await IAdmin.fromFirestore(adminSnapshot);

  // Obtener el documento del gimnasio al que pertenece el administrador
  DocumentSnapshot gymSnapshot = await FirebaseFirestore.instance
      .collection('gimnasios')
      .doc(admin.club)
      .get();

  // Convertir el documento de gym a un objeto de tipo Gym
  Gym gym = await Gym.fromFirestoreGym(gymSnapshot);
  String gymId = gymSnapshot.id;

  // Utilizar el ID del gimnasio para obtener las subcolecciones de actividades y rutinas
  List<Activity> activities = [];
  CollectionReference activitiesCollection = FirebaseFirestore.instance
      .collection('gimnasios')
      .doc(gymId)
      .collection('Activity');

  QuerySnapshot activitiesSnapshot = await activitiesCollection.get();

  // Iterar sobre las actividades y convertir cada documento en un objeto Activity
  for (var activityDoc in activitiesSnapshot.docs) {
    Activity activity = await Activity.fromFirestoreAct(activityDoc);
    activities.add(activity);
  }
  // Agregar las actividades al objeto gym
  gym.addActivities(activities);

  // Obtener la subcolección de rutinas para el gimnasio actual
  List<Routine> routines = [];
  CollectionReference routinesCollection = FirebaseFirestore.instance
      .collection('gimnasios')
      .doc(gymId)
      .collection('rutinasCargadas');

  QuerySnapshot routineSnapshot = await routinesCollection.get();

  // Iterar sobre las rutinas y convertir cada documento en un objeto Routine
  for (var routineDoc in routineSnapshot.docs) {
    Routine routine = await Routine.fromFirestoreRoutine(routineDoc);
    routines.add(routine);
  }

  // Agregar las rutinas al objeto gym
  gym.addRoutines(routines);

  // Retornar el mapa con la información del admin y el gym
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

    List<Routine> routines = [];
    CollectionReference routinesCollection =
        gymsCollection.doc(gymId).collection('rutinasCargadas');
    QuerySnapshot routineSnapshot = await routinesCollection.get();

    // Iterar sobre las actividades y convertir cada documento en un objeto Activity
    for (var routineDoc in routineSnapshot.docs) {
      Routine routine = await Routine.fromFirestoreRoutine(routineDoc);
      routines.add(routine);
    }

    gym.addRoutines(routines);

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

//---------------------------   Convert json to List  ---------------------------

Future<List<String>> loadActivities() async {
  // Cargar el archivo JSON
  final String response =
      await rootBundle.loadString('assets/json/activities.json');

  // Decodificar el JSON
  final data = json.decode(response);

  // Retornar la lista de actividades
  // Asumimos que el JSON tiene la forma { "activities": ["Musculacion", "Crossfit", "Funcional", "Personalizado"] }
  List<String> activitiesData = List<String>.from(data['activities']);

  return activitiesData; // Retornar la lista de actividades
}

//---------------------------   Add subcoleccion routine  ---------------------------

Future<void> addLoadedRoutine({
  required String nameRoutine,
  required String muscleGroup, // Nueva variable para el grupo muscular
  required String exerciseName,
  required int repetitions,
  required int series,
  required String observations,
}) async {
  try {
    User user = FirebaseAuth.instance.currentUser!;
    final docRef =
        FirebaseFirestore.instance.collection('admins').doc(user.uid);
    final docSnapshot = await docRef.get();

    // 1. Crea la referencia a la rutina (si no existe ya)
    DocumentReference routineRef = db
        .collection('gimnasios')
        .doc(docSnapshot.data()?['club'])
        .collection('rutinasCargadas')
        .doc(nameRoutine);

    final routineSnapshot = await routineRef.get();

    if (!routineSnapshot.exists) {
      // Si la rutina no existe, la creamos con el primer muscleGroup y su ejercicio
      await routineRef.set({
        'nameRoutine': nameRoutine,
        'createdAt': FieldValue.serverTimestamp(),
        'muscleGroups': {
          muscleGroup: [
            {
              'name': exerciseName,
              'repetitions': repetitions,
              'series': series,
              'observations': observations,
            }
          ]
        },
      });
      print(
          "Rutina creada exitosamente con el primer grupo muscular y ejercicio.");
    } else {
      // Si la rutina ya existe, obtenemos los datos actuales
      Map<String, dynamic> existingRoutineData =
          routineSnapshot.data() as Map<String, dynamic>;

      // Chequeamos si el grupo muscular ya existe
      if (existingRoutineData['muscleGroups'] != null &&
          existingRoutineData['muscleGroups'].containsKey(muscleGroup)) {
        // Si el grupo muscular ya existe, agrega el nuevo ejercicio
        List<dynamic> existingExercises =
            existingRoutineData['muscleGroups'][muscleGroup];

        // Verificamos si el ejercicio ya está presente en ese grupo muscular
        bool exerciseExists = existingExercises
            .any((exercise) => exercise['name'] == exerciseName);

        if (!exerciseExists) {
          existingExercises.add({
            'name': exerciseName,
            'repetitions': repetitions,
            'series': series,
            'observations': observations,
          });

          // Actualizamos el grupo muscular con la lista actualizada de ejercicios
          await routineRef.update({
            'muscleGroups.$muscleGroup': existingExercises,
          });
          print("Ejercicio agregado al grupo muscular $muscleGroup existente.");
        } else {
          print("El ejercicio ya existe en el grupo muscular $muscleGroup.");
        }
      } else {
        // Si el grupo muscular no existe, lo agregamos con el primer ejercicio
        await routineRef.update({
          'muscleGroups.$muscleGroup': [
            {
              'name': exerciseName,
              'repetitions': repetitions,
              'series': series,
              'observations': observations,
            }
          ],
        });
        print("Grupo muscular $muscleGroup creado y ejercicio agregado.");
      }
    }
  } catch (e) {
    print("Error al agregar la rutina: $e");
  }
}

Future<void> deleteRoutine(String routineId) async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
      .collection('admins')
      .doc(currentUser.uid)
      .get();

  // Convertir el documento de admin a un objeto de tipo IAdmin
  IAdmin admin = await IAdmin.fromFirestore(adminSnapshot);
  // Referencia a la subcolección de rutinas dentro del gimnasio
  CollectionReference routinesCollection =
      db.collection('gimnasios').doc(admin.club).collection('rutinasCargadas');
  // Eliminar el documento de la rutina
  await routinesCollection.doc(routineId).delete();
}

// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/objetos/user.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser;

//---------------------------   Usados  ---------------------------

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

Future<List<Map<String, dynamic>>> getGyms() async {
  List<Map<String, dynamic>> gyms = [];
  CollectionReference collectionReferenceGyms = db.collection('gimnasios');
  QuerySnapshot queryGyms = await collectionReferenceGyms.get();

  for (var documento in queryGyms.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;

    // Verifica si el array de imágenes existe y tiene al menos un elemento
    List<dynamic> images = [];
    if (data.containsKey('images') && data['images'] is List) {
      images = data['images']; // Obtén todas las imágenes
    }

    // Crea un mapa para el gimnasio
    final gym = {
      "name": data["name"],
      "id": documento.id,
      "images": images, // Añade la lista de imágenes al mapa
      "description": data["description"],
    };
    gyms.add(gym);
  }

  return gyms;
}

Future<List> getGYM() async {
  // Regresa una lista de gimnasios desde la base de datos
  List gyms = [];
  CollectionReference collectionReferenceGyms = db.collection('gimnasios');
  QuerySnapshot queryGyms = await collectionReferenceGyms.get();

  for (var documento in queryGyms.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;

    // Verifica si el array de imágenes existe y tiene al menos un elemento
    String? imageUrl;
    if (data.containsKey('images') &&
        data['images'] is List &&
        data['images'].isNotEmpty) {
      imageUrl = data['images'][0];
    }

    final gym = {
      "name": data["name"],
      "id": documento.id,
      "image": imageUrl, // Añade la URL de la imagen al objeto gym
    };
    gyms.add(gym);
  }

  return gyms;
}

Future<List> getUser(String email) async {
  List userData = [];
  try {
    DocumentSnapshot queryPeople =
        await FirebaseFirestore.instance.collection('people').doc(email).get();
    if (queryPeople.exists) {
      userData.add(queryPeople.data());
    }
  } catch (e) {
    print("Error fetching user data: $e");
  }
  return userData;
}

Future<IUser> getUserData() async {
  final _user = FirebaseAuth.instance.currentUser!;
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('people')
      .doc(_user.uid)
      .get();

  IUser user = await IUser.fromFirestore(snapshot);
  return user;
}

Future<void> updatePerson(String name) async {
  CollectionReference collectionReferenceGyms = db.collection('people');
  QuerySnapshot queryPeople = await collectionReferenceGyms.get();
  if (queryPeople.docs.isNotEmpty) {
    final firstDocumentId = queryPeople.docs.first.id;
    await db.collection("people").doc(firstDocumentId).update({
      "name": name,
    });
  }
}

Future<void> handlePayments(double amount) async {
  User user = FirebaseAuth.instance.currentUser!;
  final paymentDate = Timestamp.now();
  final expirationDate = Timestamp.fromDate(paymentDate
      .toDate()
      .add(const Duration(days: 30))); // 30 días desde la fecha de pago

  final docRef = FirebaseFirestore.instance.collection('people').doc(user.uid);

  try {
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // El documento existe, actualiza el documento
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
  } catch (e) {
    print("Error handling payment: $e");
  }
}

Future<String> getExpirateDate() async {
  User user = FirebaseAuth.instance.currentUser!;
  final doc =
      await FirebaseFirestore.instance.collection('people').doc(user.uid).get();

  if (doc.exists) {
    final data = doc.data();
    final Timestamp? timestamp = data?['expirationDate'] as Timestamp?;

    if (timestamp != null) {
      final DateTime date = timestamp.toDate();

      // Extraer año, mes y día
      final day = date.day;
      final month = date.month;
      final year = date.year;

      return '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';
    }
  }

  return ''; // Devuelve vacío si no hay datos para mostrar la fecha como string
}

//---------------------------  No Usados  ---------------------------

Future<List> getPeople() async {
  // regresa una lista de la base de datos
  List people = [];
  CollectionReference collectionReferenceGyms = db.collection('gimnasios');
  QuerySnapshot queryGyms = await collectionReferenceGyms.get();
  for (var documento in queryGyms.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      "name": data["name"],
      "id": documento.id,
    };
    people.add(person);
  }
  return people;
}

Future<void> addPassword(String password) async {
  await db.collection("people").add({
    "password": password,
  });
}

Future<List> getUserPrueba() async {
  // regresa una lista de la base de datos
  List gyms = [];
  CollectionReference collectionReferenceGyms =
      db.collection('people').doc(user?.uid) as CollectionReference<Object?>;
  QuerySnapshot queryGyms = await collectionReferenceGyms.get();
  for (var documento in queryGyms.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final gym = {
      "name": data["name"],
      "id": documento.id,
    };
    gyms.add(gym);
  }
  return gyms;
}

Future<String?> getPeoplePolenta() async {
  QuerySnapshot queryPeople = await db.collection('people').get();

  if (queryPeople.docs.isNotEmpty) {
    final documento = queryPeople.docs.first;
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    return data['name']; // Retorna los datos del primer documento.
  }
  return null;
}

Future<String?> getUserA(String name) async {
  QuerySnapshot queryPeople = await db.collection('people').get();

  if (queryPeople.docs.isNotEmpty) {
    final documento = queryPeople.docs.first;
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    name = data['name'];
    return name; // Retorna los datos del primer documento.
  }
  return null;
}

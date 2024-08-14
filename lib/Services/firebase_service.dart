// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser;

//---------------------------   Usados  ---------------------------

Future<void> saveEmailPasswordUser(String uid, String displayName,
    String nickName, String email, String gender, String phoneNumber) async {
  await db.collection('people').doc(uid).set({
    'name': displayName,
    'apellido': nickName,
    'email': email,
    'sexo': gender,
    'Numero de telefono': phoneNumber,
  });
}

Future<List> getGYM() async {
  // regresa una lista de la base de datos
  List gyms = [];
  CollectionReference collectionReferenceGyms = db.collection('gimnasios');
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

Future<DocumentSnapshot> getUserData() async {
  User user = FirebaseAuth.instance.currentUser!;
  DocumentSnapshot userData =
      await FirebaseFirestore.instance.collection('people').doc(user.uid).get();

  return userData;
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

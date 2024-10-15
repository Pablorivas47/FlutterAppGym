import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future createAcount(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return (userCredential.user?.uid);
  }

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  Future<void> loginEmailAndPassword(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> singOutLogin() async {
    await auth.signOut();
  }

  Future<bool> createUserEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
    required String nickName,
    required String gender,
    required String phoneNumber,
  }) async {
    bool created = false;
    await initializeFirebase();
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      await user!.updateDisplayName(displayName);
      created = true;
      if (created == true) {
        await saveEmailPasswordUser(
            user.uid, displayName, nickName, email, gender, phoneNumber);
      }
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        created = false;
        throw ('No se puede crear el nuevo usuario');
      }
    }
    return created;
  }
}

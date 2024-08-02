import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';

class ProviderService with ChangeNotifier {
  List<dynamic> _userData = [];
  List<dynamic> get userData => _userData;

  final User? _user = FirebaseAuth.instance.currentUser;
  User? get user => _user;

  Future<void> providerGetUserData() async {
    if (_user != null) {
      try {
        _userData = await getUser(_user.email!);
        notifyListeners();
      } catch (e) {
        print("Error getting user data: $e");
      }
    }
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/objetos/user.dart';

class ProviderService with ChangeNotifier {
  IUser? _userData;

  IUser? get userData => _userData;

  Future<void> providerGetUserData() async {
    try {
      _userData = await getUserData();
      notifyListeners();
    } catch (e) {
      print("Error getting user data: $e");
    }
  }
}

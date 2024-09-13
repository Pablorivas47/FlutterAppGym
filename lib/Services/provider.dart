import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/objetos/gym.dart';
import 'package:flutter_application_1/objetos/user.dart';

class ProviderService with ChangeNotifier {
  IUser? _userData;
  IUser? get userData => _userData;

  List<Gym>? _gymData;
  List<Gym>? get gymData => _gymData;

  List<dynamic>? _gymDataActivity;
  List<dynamic>? get gymDataActivity => _gymDataActivity;

  Future<void> providerGetUserData() async {
    try {
      _userData = await getUserData();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  Future<void> providerGetGymData() async {
    try {
      _gymData = await getGymData();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  Future<void> providerUpdateIUser(String phoneNumber) async {
    try {
      await updateIUser(phoneNumber);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  Future<void> providerUpdateHandlePayments(num amount) async {
    try {
      await updateHandlePayments(amount);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  Future<void> providerGetGymDataPointActivity(String uid) async {
    try {
      _gymDataActivity = await getGymDataPointActivity(uid);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }
}

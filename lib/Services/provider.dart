import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/firebase_service.dart';
import 'package:flutter_application_1/objetos/exercises.dart';
import 'package:flutter_application_1/objetos/gym.dart';
import 'package:flutter_application_1/objetos/user.dart';

class ProviderService with ChangeNotifier {
  IUser? _userData;
  IUser? get userData => _userData;

  Map<String, dynamic>? _adminGymData;
  Map<String, dynamic>? get adminGymData => _adminGymData;

  List<Gym>? _gymsAndActivities;
  List<Gym>? get gymsAndActivities => _gymsAndActivities;

  List<Exercises>? _exercisesData;
  List<Exercises>? get exercisesData => _exercisesData;

  List<dynamic> _filteredExercises = [];
  List<dynamic> get filteredExercises => _filteredExercises;

  Future<void> providerGetUserData() async {
    try {
      _userData = await getUserData();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  Future<void> providerGetAdminAndGymData() async {
    try {
      _adminGymData = await getAdminAndGymData();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  Future<void> providerGetGymsAndActivities() async {
    try {
      _gymsAndActivities = await getGymsAndActivities();
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

  Future<void> providerGetExercises() async {
    try {
      _exercisesData = await getExercises();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  // Método para filtrar ejercicios
  Future<void> providerGetFilteredExercises(
      String query, int selectedExercise) async {
    try {
      if (_exercisesData == null) {
        await providerGetExercises(); // Asegúrate de que los datos están disponibles
      }
      // Filtra los ejercicios basados en el texto ingresado
      final allExercises = _exercisesData?[selectedExercise].exercises ?? [];
      _filteredExercises = allExercises.where((exercise) {
        final exerciseName = exercise.toLowerCase();
        return exerciseName.contains(query.toLowerCase());
      }).toList();

      notifyListeners(); // Notifica a los listeners sobre el cambio
    } catch (e) {
      print("Error filtering exercises: $e");
    }
  }

  List<dynamic> _filteredGym = [];
  List<dynamic> get filteredGym => _filteredGym;

  Future<void> providerGetFilteredGyms(String query, String? activity) async {
    // Asegúrate de cargar los datos de los gimnasios primero
    await providerGetGymsAndActivities();

    // Filtra los gimnasios por nombre y actividad
    _filteredGym = gymsAndActivities!.where((gym) {
      final matchesActivity = activity == null ||
          gym.activities.any((activityItem) => activityItem.name == activity);
      final matchesQuery = gym.name.toLowerCase().contains(query.toLowerCase());
      return matchesActivity && matchesQuery;
    }).toList();

    notifyListeners();
  }
}

import 'dart:async';

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

  // Getter para el Stream
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

  TextEditingController filterExercisesController = TextEditingController();
  int selectedExercise = 0; // Valor por defecto

  ProviderService() {
    // Constructor de provider
    // Escuchar cambios en el filtro de texto
    filterGymController.addListener(() {
      providerGetFilteredGyms();
    });

    providerGetFilteredGyms();

    filterExercisesController.addListener(() {
      providerGetFilteredExercises();
    });
  }

  void setSelectedExercise(int selected) {
    selectedExercise = selected;
    notifyListeners(); // Notificar a los listeners sobre el cambio
    providerGetFilteredExercises(); // Filtrar ejercicios cada vez que se cambia el ejercicio seleccionado
  }

  // Método para obtener los ejercicios filtrados
  Future<void> providerGetFilteredExercises() async {
    try {
      // Asegúrate de que los datos de ejercicios estén disponibles
      await providerGetExercises();
      await providerGetGymsAndActivities();

      // Filtrar los ejercicios basados en el grupo muscular (selectedExercise) y el texto ingresado
      final allExercises = _exercisesData?[selectedExercise].exercises ?? [];

      _filteredExercises = allExercises.where((exercise) {
        final exerciseName = exercise
            .toLowerCase(); // Asegúrate que sea en minúsculas para comparar
        return exerciseName
            .contains(filterExercisesController.text.toLowerCase());
      }).toList();

      notifyListeners(); // Notificar cambios a la UI
    } catch (e) {
      print("Error filtering exercises: $e");
    }
  }

  List<dynamic> _filteredGym = [];
  List<dynamic> get filteredGym => _filteredGym;
  TextEditingController filterGymController = TextEditingController();
  String selectedActivity = 'Todos'; // Valor por defecto

  void setSelectedGym(String selected) {
    selectedActivity = selected;
    notifyListeners(); // Notificar a los listeners sobre el cambio
    providerGetFilteredGyms(); // Filtrar ejercicios cada vez que se cambia el ejercicio seleccionado
  }

  // String query, String? activity
  Future<void> providerGetFilteredGyms() async {
    // Asegúrate de cargar los datos de los gimnasios primero
    await providerGetGymsAndActivities();
    await providerLoadActivities();

    // Filtra los gimnasios por nombre y actividad
    _filteredGym = gymsAndActivities!.where((gym) {
      final matchesActivity = selectedActivity == 'Todos' ||
          gym.activities
              .any((activityItem) => activityItem.name == selectedActivity);
      final matchesQuery = gym.name
          .toLowerCase()
          .contains(filterGymController.text.toLowerCase());
      return matchesActivity && matchesQuery;
    }).toList();

    notifyListeners();
  }

  List<String> _activities = [];
  List<String> get activities => _activities;

  Future<void> providerLoadActivities() async {
    try {
      _activities = await loadActivities();
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  Future<void> providerAddLoadedRoutine(
      String nameRoutine,
      String exerciseName,
      int repetitions,
      int series,
      String observations,
      String muscleGroup) async {
    try {
      await addLoadedRoutine(
          nameRoutine: nameRoutine,
          exerciseName: exerciseName,
          repetitions: repetitions,
          series: series,
          observations: observations,
          muscleGroup: muscleGroup);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  TextEditingController searchController = TextEditingController();

  Future<void> providerDeleteRoutine(String routineId) async {
    try {
      await deleteRoutine(routineId);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error getting user data: $e");
    }
  }

  // Stream que emite la lista de rutinas
}

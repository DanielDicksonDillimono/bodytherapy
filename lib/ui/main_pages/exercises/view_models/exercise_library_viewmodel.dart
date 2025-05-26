import 'package:bodytherapy/data/repositories/exercises_repository.dart';
import 'package:bodytherapy/domain/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:bodytherapy/core/shared_elements.dart';

class ExerciseLibraryViewModel extends ChangeNotifier {
  ExerciseLibraryViewModel({required ExercisesRepository exerciseRepository})
      : _exercisesRepository = exerciseRepository;

  final ExercisesRepository _exercisesRepository;

  ExerciseTarget exerciseTarget = ExerciseTarget.all;

  late List<Exercise> exercisesToDisplay;

  Future<void> initValues() async {
    List<Exercise> allExercises = await getAllxercises();
    exercisesToDisplay = getFilteredExercises(allExercises);
    notifyListeners();
  }

  Future<List<Exercise>> getAllxercises() async {
    List<Exercise> allExercises = [];

    allExercises = await _exercisesRepository.getAllExercises();

    return allExercises;
  }

  void filterExercises(ExerciseTarget target) {
    exerciseTarget = target;
    notifyListeners();
  }

  List<Exercise> getFilteredExercises(List<Exercise> exercises) {
    if (exerciseTarget == ExerciseTarget.all) {
      return exercises;
    } else {
      return exercises
          .where((exercise) => exercise.target == exerciseTarget.name)
          .toList();
    }
  }
}

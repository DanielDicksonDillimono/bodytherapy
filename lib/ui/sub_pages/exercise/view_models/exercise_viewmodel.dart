import 'package:bodytherapy/data/repositories/exercises_repository.dart';
import 'package:bodytherapy/domain/models/exercise_model.dart';
import 'package:flutter/widgets.dart';

class ExerciseViewmodel extends ChangeNotifier {
  ExerciseViewmodel({
    required this.exerciseModel,
    required ExercisesRepository exercisesRepository,
  }) : _exercisesRepository = exercisesRepository;

  final Exercise exerciseModel;
  final ExercisesRepository _exercisesRepository;

  String get exerciseName => exerciseModel.name;
  String get exerciseDescription => exerciseModel.description;
  String get exerciseTarget => exerciseModel.target;
  String get exerciseYoutubeLink => exerciseModel.youtubeLink;

  Future<void> addExerciseToFavorites() async {
    await _exercisesRepository.addExerciseTofavorites(exerciseModel);
  }
}

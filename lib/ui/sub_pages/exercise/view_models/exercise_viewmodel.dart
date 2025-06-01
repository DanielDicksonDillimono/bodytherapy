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
  String get exerciseId => exerciseModel.id;
  String get exerciseTarget => exerciseModel.target;
  String get exerciseCreatorId => exerciseModel.creatorId;
  bool get isUserCreated => exerciseModel.creatorId.isNotEmpty;
  bool get isAppGenerated => exerciseModel.creatorId.isEmpty;

  Future<void> addExerciseToFavorites() async {
    await _exercisesRepository.addExerciseTofavorites(exerciseModel);
  }
}

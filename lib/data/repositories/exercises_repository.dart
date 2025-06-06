import 'package:bodytherapy/domain/models/exercise_model.dart';

class ExercisesRepository {
  Future<List<Exercise>> getExercises(List<String> exerciseIds) async {
    List<Exercise> foundExercises = [];
    //await get exercises from DB

    return foundExercises;
  }

  Future<List<Exercise>> getAllExercises() async {
    List<Exercise> foundExercises = [];
    //await get exercises from DB

    return foundExercises;
  }

  Future<Exercise> getExercise(String exerciseId) async {
    Exercise foundExercise = Exercise(
      id: exerciseId,
      name: '',
      description: '',
      target: ExerciseTarget.all,
      creatorId: '',
    );
    //await get exercise from DB

    return foundExercise;
  }

  Future addExerciseTofavorites(Exercise exercise) async {
    //await add exercise to favorites in DB
  }
}

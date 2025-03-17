import 'package:flutter/material.dart';
import '../view_models/exercises_model.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key, required this.exercisesModel});

  final ExercisesModel exercisesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Exercises page"),
      ),
    );
  }
}

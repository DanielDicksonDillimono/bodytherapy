import 'package:flutter/material.dart';
import '../view_models/exercise_library_viewmodel.dart';

class ExerciseLibraryPage extends StatelessWidget {
  const ExerciseLibraryPage({super.key, required this.exerciseLibraryModel});

  final ExerciseLibraryViewModel exerciseLibraryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Exercises page"),
      ),
    );
  }
}

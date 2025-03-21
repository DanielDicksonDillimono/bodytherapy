import 'package:bodytherapy/models/exercise_model.dart';
import 'package:bodytherapy/ui/exercises/widgets/exercise_page.dart';
import 'package:flutter/material.dart';

class ExcerciseCard extends StatelessWidget {
  const ExcerciseCard({super.key, required this.exerciseModel});
  final ExerciseModel exerciseModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                ExercisePage(exerciseModel: exerciseModel)));
      },
      child: ListTile(
        leading: Icon(Icons.accessibility_new_rounded),
        title: Text(exerciseModel.name),
        subtitle: Text(exerciseModel.targetArea),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ),
    );
  }
}

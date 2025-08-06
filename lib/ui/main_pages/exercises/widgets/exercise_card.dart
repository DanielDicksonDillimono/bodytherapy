import 'package:bodytherapy/domain/models/exercise_model.dart';
import 'package:bodytherapy/ui/sub_pages/exercise/widgets/exercise_page.dart';
import 'package:flutter/material.dart';

class ExcerciseCard extends StatelessWidget {
  const ExcerciseCard({super.key, required this.exerciseModel});
  final Exercise exerciseModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                ExercisePage(exerciseModel: exerciseModel)));
      },
      child: Card(
        shape: RoundedRectangleBorder(),
        elevation: 1.0,
        child: ListTile(
          leading: Icon(Icons.accessibility_new_rounded),
          title: Text(exerciseModel.name),
          subtitle: Text(exerciseModel.target),
        ),
      ),
    );
  }
}

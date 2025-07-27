import 'package:bodytherapy/domain/models/exercise_model.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

class ExercisePage extends StatelessWidget {
  const ExercisePage({required this.exerciseModel, super.key});

  final Exercise exerciseModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exerciseModel.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              Text(
                'Target: ${exerciseModel.target}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              Text(
                exerciseModel.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              if (exerciseModel.youtubeLink.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    // Launch the YouTube link
                    launchUrl(Uri.parse(exerciseModel.youtubeLink));
                  },
                  child: Text('Watch on YouTube'),
                ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
            ],
          ),
        ),
      )),
    );
  }
}

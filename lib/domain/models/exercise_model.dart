//Exercises can either be user created or App generated.
class Exercise {
  // const Exercise(
  //     {required String name,
  //     required String description,
  //     required String target,
  //     required String youtubeLink})
  //     : _name = name,
  //       _description = description,
  //       _target = target,
  //       _youtubeLink = youtubeLink;
  Exercise(Map<String, String> exerciseData)
      : _name = exerciseData['name'] ?? '',
        _description = exerciseData['description'] ?? '',
        _target = exerciseData['target'] ?? '',
        _youtubeLink = exerciseData['youtubeLink'] ?? '';

  final String _name;
  final String _description;
  final String _target;
  final String _youtubeLink;
  String get name => _name;
  String get description => _description;
  String get target => _target;
  String get youtubeLink => _youtubeLink;
}

enum ExerciseTarget {
  upperBody,
  lowerBody,
  core,
  fullBody,
  cardio,
  flexibility,
  balance,
  back,
  chest,
  shoulders,
  arms,
  legs,
  none,
  all
}

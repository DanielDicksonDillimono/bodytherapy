//Exercises can either be user created or App generated.
class Exercise {
  const Exercise(
      {required String name,
      required String id,
      required String description,
      required String creatorId,
      required ExerciseTarget target})
      : _name = name,
        _id = id,
        _description = description,
        _creatorId = creatorId,
        _target = target;

  final String _name;
  final String _id;
  final String _creatorId;
  final String _description;
  final ExerciseTarget _target;

  String get name => _name;
  String get id => _id;
  String get creatorId => _creatorId;
  String get description => _description;
  String get target => _target.name;
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

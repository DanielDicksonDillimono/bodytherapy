//Exercises can either be user created or App generated.
class ExerciseModel {
  const ExerciseModel(
      {required String name, required String id, required String description})
      : _name = name,
        _id = id,
        _description = description,
        _creatorId = " ";
  final String _name;
  final String _id;
  final String _creatorId;
  final String _description;

  String get name => _name;
  String get id => _id;
  String get creatorId => _creatorId;
  String get description => _description;
}

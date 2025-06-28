class Report {
  Report({
    required String name,
    required String description,
    required DateTime reportedDate,
    required AffectedArea affectedArea,
    List<String> prescribedExercisesIds = const [],
  })  : _description = description,
        _reportedDate = reportedDate,
        _prescribedExercisesIds = prescribedExercisesIds,
        _name = name,
        _affectedArea = affectedArea;

  final String _name;
  final String _description;
  final DateTime _reportedDate;
  final List<String> _prescribedExercisesIds;
  final AffectedArea _affectedArea;

  String get description => _description;
  DateTime get reportedDate => _reportedDate;
  String get name => _name;
  AffectedArea get affectedArea => _affectedArea;
  List<String> get prescribedExercisesIds => _prescribedExercisesIds;
}

enum AffectedArea {
  head,
  neck,
  back,
  chest,
  abdomen,
  arms,
  legs,
  feet,
  other,
}

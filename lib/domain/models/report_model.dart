class Report {
  Report({
    required String name,
    required String description,
    required DateTime reportedDate,
    required AffectedArea affectedArea,
    List<String>? prescribedExercisesIds,
    String? diagnosis,
  })  : _description = description,
        _reportedDate = reportedDate,
        _prescribedExercisesIds = prescribedExercisesIds,
        _name = name,
        _affectedArea = affectedArea,
        _diagnosis = diagnosis;

  final String _name;
  final String _description;
  final DateTime _reportedDate;
  final List<String>? _prescribedExercisesIds;
  final AffectedArea _affectedArea;
  final String? _diagnosis;

  String get description => _description;
  DateTime get reportedDate => _reportedDate;
  String get name => _name;
  AffectedArea get affectedArea => _affectedArea;
  List<String>? get prescribedExercisesIds => _prescribedExercisesIds;
  String? get getDiagnosis => _diagnosis;
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

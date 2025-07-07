class Report {
  Report({
    this.name,
    required String description,
    required DateTime reportedDate,
    required AffectedArea affectedArea,
    List<String>? prescribedExercisesIds,
    this.recommendation,
    this.diagnosis,
  })  : _description = description,
        _reportedDate = reportedDate,
        _prescribedExercisesIds = prescribedExercisesIds,
        _affectedArea = affectedArea;

  String? name;
  final String _description;
  final DateTime _reportedDate;
  final List<String>? _prescribedExercisesIds;
  final AffectedArea _affectedArea;
  String? diagnosis;
  String? recommendation;

  String get description => _description;
  DateTime get reportedDate => _reportedDate;
  AffectedArea get affectedArea => _affectedArea;
  List<String>? get prescribedExercisesIds => _prescribedExercisesIds;
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

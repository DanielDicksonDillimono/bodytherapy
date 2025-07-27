class Report {
  Report({
    this.name,
    required String description,
    required String priorActivityDescription,
    required DateTime reportedDate,
    required AffectedArea affectedArea,
    required String painInducingActivity,
    List<Map<String, String>>? prescribedExercises,
    this.recommendation,
    this.diagnosis,
    this.id,
  })  : _description = description,
        _reportedDate = reportedDate,
        _prescribedExercises = prescribedExercises,
        _affectedArea = affectedArea,
        _priorActivityDescription = priorActivityDescription,
        _painInducingActivity = painInducingActivity;

  String? name;
  String? id;
  final String _description;
  final DateTime _reportedDate;
  final List<Map<String, String>>? _prescribedExercises;
  final AffectedArea _affectedArea;
  final String _priorActivityDescription;
  final String _painInducingActivity;
  String? diagnosis;
  String? recommendation;

  String get description => _description;
  DateTime get reportedDate => _reportedDate;
  AffectedArea get affectedArea => _affectedArea;
  String get painInducingActivity => _painInducingActivity;
  String get priorActivityDescription => _priorActivityDescription;
  List<Map<String, String>>? get prescribedExercises => _prescribedExercises;
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

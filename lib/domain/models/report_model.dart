class Report {
  Report(
      {required String reporterId,
      required String assignedCareTakerId,
      required String description,
      required DateTime reportedDate,
      required List<String> prescribedExercisesIds})
      : _reporterId = reporterId,
        _assignedCareTakerId = "",
        _description = description,
        _reportedDate = reportedDate,
        _prescribedExercisesIds = prescribedExercisesIds;

  final String _reporterId;
  final String _assignedCareTakerId;
  final String _description;
  final DateTime _reportedDate;
  final List<String> _prescribedExercisesIds;

  String get reporterId => _reporterId;
  String get assignedCareTakerId => _assignedCareTakerId;
  String get description => _description;
  DateTime get reportedDate => _reportedDate;
  List<String> get prescribedExercisesIds => _prescribedExercisesIds;
}

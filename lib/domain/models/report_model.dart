class ReportModel {
  ReportModel(
      {required String reporterId,
      required String assignedCareTakerId,
      required String description,
      required DateTime reportedDate})
      : _reporterId = reporterId,
        _assignedCareTakerId = "",
        _description = description,
        _reportedDate = reportedDate;

  final String _reporterId;
  final String _assignedCareTakerId;
  final String _description;
  final DateTime _reportedDate;

  String get reporterId => _reporterId;
  String get assignedCareTakerId => _assignedCareTakerId;
  String get description => _description;
  DateTime get reportedDate => _reportedDate;
}

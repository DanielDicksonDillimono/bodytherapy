import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:flutter/foundation.dart';

class DiagnosisPreviewViewmodel extends ChangeNotifier {
  DiagnosisPreviewViewmodel({
    required this.reportsRepository,
  });

  final ReportsRepository reportsRepository;
  bool isLoading = false;

  Future acceptDiagnosis(Report report) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    try {
      await reportsRepository.saveReport(report);
    } catch (e) {
      throw Exception('Error Saving report: ${e.toString()}');
    }
    isLoading = false;
    notifyListeners();
  }
}

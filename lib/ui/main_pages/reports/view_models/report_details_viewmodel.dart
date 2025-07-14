import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:flutter/material.dart';

class ReportDetailsViewmodel extends ChangeNotifier {
  ReportDetailsViewmodel({
    required this.reportsRepository,
  });

  final ReportsRepository reportsRepository;

  bool isLoading = false;

  Future<void> deleteReport(String reportId, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await reportsRepository.deleteReport(reportId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Report deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting report: $e')),
      );
    } finally {
      isLoading = false;
      Navigator.pop(context);
      notifyListeners();
    }
  }
}

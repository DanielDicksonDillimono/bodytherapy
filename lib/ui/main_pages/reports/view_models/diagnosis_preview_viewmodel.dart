import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/navigation/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiagnosisPreviewViewmodel extends ChangeNotifier {
  DiagnosisPreviewViewmodel({
    required this.reportsRepository,
  });

  final ReportsRepository reportsRepository;
  bool isLoading = false;

  Future acceptDiagnosis(Report report, BuildContext context) async {
    String errorMessage = '';
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    try {
      await reportsRepository.saveReport(report);
    } catch (e) {
      errorMessage = e.toString().trim();
    }
    if (context.mounted) {
      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving report: $errorMessage')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Report saved successfully')),
        );
        Navigator.popUntil(context,
            ModalRoute.withName(Routes.home)); // Close the preview dialog
      }
    }
    isLoading = false;
    notifyListeners();
  }
}

import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/diagnosis_preview_viewmodel.dart';
import 'package:bodytherapy/ui/main_pages/reports/widgets/diagnosis_previewer.dart';
import 'package:flutter/material.dart';

class ReportCreationViewmodel extends ChangeNotifier {
  ReportCreationViewmodel({
    required this.reportsRepository,
  });

  final ReportsRepository reportsRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();

  AffectedArea selectedArea = AffectedArea.other;

  bool isLoading = false;

  void setSelectedArea(AffectedArea area) {
    selectedArea = area;
    notifyListeners();
  }

  Future<void> createReport(BuildContext context) async {
    if (isLoading) return;
    // Prevent multiple submissions
    isLoading = true;
    if (!formKey.currentState!.validate()) return;
    try {
      await reportsRepository.createReport(Report(
        description: descriptionController.text.trim(),
        affectedArea: selectedArea,
        reportedDate: DateTime.now(),
      ));
    } catch (e) {
      String message = e.toString().trim();
      context.mounted ? showErrorMessage(context, message) : null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> previewReport(BuildContext context) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();

    if (!formKey.currentState!.validate()) return;
    try {
      var report = Report(
        description: descriptionController.text.trim(),
        affectedArea: selectedArea,
        reportedDate: DateTime.now(),
      );
      var diagnosis = await reportsRepository.diagnoseReport(report);
      report.name = diagnosis['name'];
      report.diagnosis = diagnosis['diagnosis'];
      report.recommendation = diagnosis['recommendation'];

      context.mounted
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DiagnosisPreviewer(
                  report: report,
                  diagnosisPreviewViewmodel: DiagnosisPreviewViewmodel(
                    reportsRepository: reportsRepository,
                  ),
                ),
              ),
            )
          : null;
    } catch (e) {
      String message = e.toString().trim();
      context.mounted ? showErrorMessage(context, message) : null;
    }

    // isLoading = false;
    // notifyListeners();
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

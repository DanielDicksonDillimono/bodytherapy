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
  final TextEditingController painInducingActivityController =
      TextEditingController();
  final TextEditingController priorActivityDescriptionContoller =
      TextEditingController();

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
        priorActivityDescription: priorActivityDescriptionContoller.text.trim(),
        painInducingActivity: painInducingActivityController.text.trim(),
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
      var undiagnosedReport = Report(
        description: descriptionController.text.trim(),
        priorActivityDescription: priorActivityDescriptionContoller.text.trim(),
        affectedArea: selectedArea,
        painInducingActivity: painInducingActivityController.text.trim(),
        reportedDate: DateTime.now(),
      );
      var diagnosis = await reportsRepository.diagnoseReport(
        undiagnosedReport,
      );
      var report = Report(
        name: diagnosis['name'],
        diagnosis: diagnosis['diagnosis'],
        recommendation: diagnosis['recommendation'],
        prescribedExercises: (diagnosis['exercises'] as List)
            .map((e) => Map<String, String>.from(e as Map))
            .toList(),
        description: undiagnosedReport.description,
        priorActivityDescription: undiagnosedReport.priorActivityDescription,
        affectedArea: undiagnosedReport.affectedArea,
        reportedDate: undiagnosedReport.reportedDate,
        painInducingActivity: undiagnosedReport.painInducingActivity,
        citations: List<String>.from(diagnosis['citations']),
      );

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
    isLoading = false;
    notifyListeners();
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

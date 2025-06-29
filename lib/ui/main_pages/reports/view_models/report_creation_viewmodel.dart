import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:flutter/material.dart';

class ReportCreationViewmodel extends ChangeNotifier {
  ReportCreationViewmodel({
    required this.reportsRepository,
  });

  final ReportsRepository reportsRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AffectedArea selectedArea = AffectedArea.other;

  void setSelectedArea(AffectedArea area) {
    selectedArea = area;
    notifyListeners();
  }

  Future<void> createReport(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    try {
      await reportsRepository.createReport(Report(
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        affectedArea: selectedArea,
        reportedDate: DateTime.now(),
      ));
    } catch (e) {
      String message = e.toString().trim();
      context.mounted ? showErrorMessage(context, message) : null;
    }
  }

  Future<void> previewReport(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    try {
      final report = Report(
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        affectedArea: selectedArea,
        reportedDate: DateTime.now(),
      );
      // Navigate to the report details page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ReportDatailsPage(report: report),
      //   ),
      // );
    } catch (e) {
      String message = e.toString().trim();
      context.mounted ? showErrorMessage(context, message) : null;
    }
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

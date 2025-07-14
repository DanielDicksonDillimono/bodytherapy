import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:bodytherapy/data/repositories/user_repository.dart';
import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/domain/models/user_model.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/report_creation_viewmodel.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/report_details_viewmodel.dart';
import 'package:bodytherapy/ui/main_pages/reports/widgets/report_creation_page.dart';
import 'package:bodytherapy/ui/main_pages/reports/widgets/report_datails_page.dart';
import 'package:flutter/material.dart';

class ReportsViewmodel extends ChangeNotifier {
  ReportsViewmodel(
      {required ReportsRepository reportsRepository,
      required UserRepository userRepository})
      : _reportsRepository = reportsRepository,
        _userRepository = userRepository;

  final ReportsRepository _reportsRepository;
  final UserRepository _userRepository;

  List<Report> _allReports = [];
  List<Report> _diagnosedReports = [];
  User? user;

  bool isLoading = false;

  List<Report> get allReports => _allReports;
  List<Report> get diagnosedReports => _diagnosedReports;
  Stream<List<Report>> get reportsStream =>
      _reportsRepository.getReportsStream();

  Future initValues() async {
    isLoading = true;
    try {
      user = await _userRepository.getUser();
      if (user == null) return;
      String userId = user!.id;
      _allReports = await _reportsRepository.getAllReports(userId);
      _diagnosedReports = await _reportsRepository.getDiagnosedReports(userId);
    } catch (e) {
      // String message = e.toString().trim();
      // context.mounted ? showErrorMessage(context, message) : null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createReport(Report report, BuildContext context) async {
    try {
      if (user == null) return;
      await _reportsRepository.createReport(report);
      _allReports.add(report);
      initValues();
      // notifyListeners();
    } catch (e) {
      String message = e.toString().trim();
      context.mounted ? showErrorMessage(context, message) : null;
    }
  }

  void openReportDetails(BuildContext context, Report report) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportDatailsPage(
          report: report,
          reportDetailsViewmodel: ReportDetailsViewmodel(
            reportsRepository: _reportsRepository,
          ),
        ),
      ),
    );
  }

  void openCreateReportPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportCreationPage(
          reportCreationViewmodel: ReportCreationViewmodel(
            reportsRepository: _reportsRepository,
          ),
        ),
      ),
    );
  }

  void createReportCallback(BuildContext context, Report report) {
    createReport(report, context);
  }

  void openReportDetailsCallback(BuildContext context, Report report) {
    openReportDetails(context, report);
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

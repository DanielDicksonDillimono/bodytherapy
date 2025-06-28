// Manages access to users reports.
// Will fetch, update, filter or archive a report

import 'package:bodytherapy/data/services/ai_service.dart';
import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/data/database/database_service.dart';

class ReportsRepository {
  //Get Reports
  //Sort based on diagnosed and undiagnosed

  ReportsRepository({
    required DatabaseService databaseService,
    required AiService aiService,
  })  : _databaseService = databaseService,
        _aiService = aiService;
  final DatabaseService _databaseService;
  final AiService _aiService;

  Future<List<Report>> getAllReports(String userId) async {
    List<Report> retreivedReports = [];
    try {} catch (e) {
      //diplay error
    }
    return retreivedReports;
  }

  Future createReport(Report report) async {
    try {
      final data = {
        'title': report.name,
        'description': report.description,
        'date': report.reportedDate.toIso8601String(),
      };
      await _databaseService.createReport(data);
    } catch (e) {
      //diplay error
    }
  }

  Future updateReport(Report report) async {
    try {} catch (e) {
      //diplay error
    }
  }

  Future<List<Report>> getDiagnosedReports(String userId) async {
    List<Report> retreivedReports = [];
    //fetch reports from DB
    try {} catch (e) {
      //diplay error
    }
    return retreivedReports;
  }

  Future saveReport() async {
    try {} catch (e) {
      //diplay error
    }
    //save to DB
  }

  Future deleteReport(Report report) async {
    try {} catch (e) {
      //diplay error
    }
    //delete from db
  }
}

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

  Stream<List<Report>> getReportsStream() {
    return _databaseService.reportsStream.map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Report(
          name: data['title'] ?? '',
          id: doc.id,
          description: data['description'] ?? '',
          reportedDate: DateTime.parse(data['date']),
          affectedArea: AffectedArea.values.firstWhere(
            (area) => area.name == data['affectedArea'],
            orElse: () => AffectedArea.other,
          ),
          diagnosis: data['diagnosis'] ?? '',
          recommendation: data['recommendation'] ?? '',
        );
      }).toList();
    });
  }

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

  Future<Map<String, dynamic>> diagnoseReport(Report report) async {
    Map<String, dynamic> response = {};
    try {
      final responseDiagnosis = await _aiService.diagnose(report.description);
      response = {
        'name': responseDiagnosis['name'],
        'diagnosis': responseDiagnosis['diagnosis'],
        'recommendation': responseDiagnosis['recommendation'],
        'affectedArea': report.affectedArea,
        'reportedDate': report.reportedDate.toIso8601String(),
      };
    } catch (e) {
      //diplay error
    }
    return response;
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

  Future saveReport(Report report) async {
    try {
      final data = {
        'title': report.name,
        'description': report.description,
        'date': report.reportedDate.toIso8601String(),
        'affectedArea': report.affectedArea.name,
        'diagnosis': report.diagnosis,
        'recommendation': report.recommendation,
      };
      await _databaseService.createReport(data);
    } catch (e) {
      //diplay error
    }
    //save to DB
  }

  Future deleteReport(String reportId) async {
    try {
      await _databaseService.deleteReport(reportId);
    } catch (e) {
      //diplay error
    }
    //delete from db
  }
}

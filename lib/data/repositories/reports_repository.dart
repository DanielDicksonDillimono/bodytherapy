// Manages access to users reports.
// Will fetch, update, filter or archive a report

import 'package:bodytherapy/domain/models/report_model.dart';

class ReportsRepository {
  //Get Reports
  //Sort based on diagnosed and undiagnosed

  const ReportsRepository();

  Future<List<Report>> getAllReports(String userId) async {
    List<Report> retreivedReports = [];
    //fetch reports from DB
    try {} catch (e) {
      //diplay error
    }
    return retreivedReports;
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

import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:flutter/material.dart';
import 'package:bodytherapy/domain/models/report_model.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required ReportsRepository reportsRepository})
      : _reportsRepository = reportsRepository {
    getUsersDiagnosedReports();
  }

  final ReportsRepository _reportsRepository;

  //get only reports with diagnosis.
  Future<List<Report>> getUsersDiagnosedReports() async {
    List<Report> retreivedReports = [];

    try {
      retreivedReports = await _reportsRepository.getDiagnosedReports();
    } finally {
      notifyListeners();
    }

    return retreivedReports;
  }

  Future<List<Report>> getAllUsersReports() async {
    List<Report> retreivedReports = [];

    try {
      retreivedReports = await _reportsRepository.getAllReports();
    } finally {
      notifyListeners();
    }

    return retreivedReports;
  }
}

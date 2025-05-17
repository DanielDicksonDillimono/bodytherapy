import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:bodytherapy/data/repositories/user_repository.dart';
import 'package:bodytherapy/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:bodytherapy/domain/models/report_model.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(
      {required ReportsRepository reportsRepository,
      required UserRepository userRepository})
      : _reportsRepository = reportsRepository,
        _userRepository = userRepository {
    getUsersDiagnosedReports();
  }

  final ReportsRepository _reportsRepository;
  final UserRepository _userRepository;
  User? _user;

  Future<User?> initUser() async {
    User? user;
    try {
      user = await _userRepository.getUser();
    } catch (e) {
      //display error
    }
    return user;
  }

  //get only reports with diagnosis.
  Future<List<Report>> getUsersDiagnosedReports() async {
    List<Report> retreivedReports = [];
    if (_user != null) {
      try {
        retreivedReports =
            await _reportsRepository.getDiagnosedReports(_user!.id);
      } finally {
        notifyListeners();
      }
    }

    return retreivedReports;
  }

  Future<List<Report>> getAllUsersReports() async {
    List<Report> retreivedReports = [];
    if (_user != null) {
      try {
        retreivedReports = await _reportsRepository.getAllReports(_user!.id);
      } finally {
        notifyListeners();
      }
    }
    return retreivedReports;
  }
}

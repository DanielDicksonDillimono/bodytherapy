import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:bodytherapy/data/repositories/user_repository.dart';
import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/domain/models/user_model.dart';
import 'package:flutter/material.dart';

class ReportsViewmodel extends ChangeNotifier {
  ReportsViewmodel(
      {required ReportsRepository reportsRepository,
      required UserRepository userRepository})
      : _reportsRepository = reportsRepository,
        _userRepository = userRepository;

  final ReportsRepository _reportsRepository;
  final UserRepository _userRepository;

  late List<Report> _allReports;
  late List<Report> _diagnosedReports;
  User? user;

  List<Report> get allReports => _allReports;
  List<Report> get diagnosedReports => _diagnosedReports;

  Future initValues() async {
    user = await _userRepository.getUser();
    if (user == null) return;

    String userId = user!.id;
    _allReports = await _reportsRepository.getAllReports(userId);
    _diagnosedReports = await _reportsRepository.getDiagnosedReports(userId);
  }
}

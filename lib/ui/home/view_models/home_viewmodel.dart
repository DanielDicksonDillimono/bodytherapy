import 'package:bodytherapy/data/repositories/reports_repository.dart';
import 'package:flutter/material.dart';
import '../../../data/repositories/user_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(
      {required UserRepository userRepository,
      required ReportsRepository reportsRepository})
      : _userRepository = userRepository,
        _reportsRepository = reportsRepository;

  final UserRepository _userRepository;
  final ReportsRepository _reportsRepository;

  Future getUsersReports() async {
    try {} finally {
      notifyListeners();
    }
  }
}

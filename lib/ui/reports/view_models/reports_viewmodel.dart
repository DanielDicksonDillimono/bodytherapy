import 'package:flutter/material.dart';

class ReportsViewmodel extends ChangeNotifier {
  int vibe = 1;

  void notifiyWidgets() {
    vibe++;
    notifyListeners();
  }
}

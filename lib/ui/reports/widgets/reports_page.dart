import 'package:bodytherapy/ui/reports/view_models/reports_viewmodel.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key, required this.reportsViewmodel});

  final ReportsViewmodel reportsViewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Reports Pages"),
      ),
    );
  }
}

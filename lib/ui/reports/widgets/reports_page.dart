import 'package:bodytherapy/ui/reports/view_models/reports_viewmodel.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key, required this.reportsViewmodel});

  final ReportsViewmodel reportsViewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListenableBuilder(
        listenable: reportsViewmodel,
        builder: (context, _) => ListView.builder(
            itemBuilder: (BuildContext context, int index) => Card()),
      )),
    );
  }
}

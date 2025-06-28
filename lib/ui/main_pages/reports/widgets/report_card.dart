import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.report,
    required this.onTap,
  });
  final Report report;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(report.name),
        subtitle: Text(report.description),
        leading: CircleAvatar(
          //TODO: Use affected area icon
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            report.name.isNotEmpty ? report.name[0].toUpperCase() : '?',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

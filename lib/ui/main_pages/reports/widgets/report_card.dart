import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/ui/main_pages/reports/widgets/report_datails_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.report,
  });
  final Report report;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(report.name ?? 'Report on ${report.reportedDate}'),
        subtitle: Text(DateFormat('dd/MM/yyyy').format(report.reportedDate)),
        leading: CircleAvatar(
          //TODO: Use affected area icon
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            report.name != null ? report.name![0] : '?',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportDatailsPage(report: report),
          ),
        ),
      ),
    );
  }
}

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
        title: Text(
          report.name ?? 'Report on ${report.reportedDate}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('dd/MM/yyyy').format(report.reportedDate),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        leading: Icon(
          Icons.medical_services,
          color: Theme.of(context).colorScheme.primary,
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

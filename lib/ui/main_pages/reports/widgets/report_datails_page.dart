import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportDatailsPage extends StatelessWidget {
  const ReportDatailsPage({super.key, required this.report});

  final Report report;

  //TODO: AppLocalization for text strings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(report.name ?? 'Report Details'),
          ),
      body: Padding(
        padding: Dimens.of(context).edgeInsetsScreenSymmetric,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                report.name ?? 'Report on ${report.reportedDate}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              Text(
                'Affected Area: ${report.affectedArea.name}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Reported Date: ${DateFormat('dd/MM/yyyy').format(report.reportedDate)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              Text(
                'Report Details',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              Text(
                report.description,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              Text(
                report.diagnosis ?? 'No diagnosis available',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

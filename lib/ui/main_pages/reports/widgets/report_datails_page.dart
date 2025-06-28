import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class ReportDatailsPage extends StatelessWidget {
  const ReportDatailsPage({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(report.name),
      ),
      body: Padding(
        padding: Dimens.of(context).edgeInsetsScreenSymmetric,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Report Details',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16.0),
            Text('Affected Area: ${report.affectedArea.name}',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
              report.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

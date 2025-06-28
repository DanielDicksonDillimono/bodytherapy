import 'package:bodytherapy/ui/main_pages/reports/view_models/reports_viewmodel.dart';
import 'package:bodytherapy/ui/main_pages/reports/widgets/report_card.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key, required this.reportsViewmodel});

  final ReportsViewmodel reportsViewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: reportsViewmodel.isLoading
            ? null
            : () => reportsViewmodel.openCreateReportPage(context),
        icon: Icon(Icons.add),
        label: Text('Create Report'),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: reportsViewmodel,
          builder: (context, _) => ListView.builder(
            itemCount: reportsViewmodel.allReports.length,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) =>
                reportsViewmodel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ReportCard(
                        key: Key(index.toString() +
                            reportsViewmodel.allReports[index].name),
                        report: reportsViewmodel.allReports[index],
                        onTap: () => reportsViewmodel.openReportDetails(
                            context, reportsViewmodel.allReports[index]),
                      ),
          ),
        ),
      ),
    );
  }
}

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
        child: StreamBuilder(
          stream: reportsViewmodel.reportsStream,
          builder: (context, snapshot) => ListView.builder(
            itemCount: snapshot.hasData ? snapshot.data!.length : 0,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (BuildContext context, int index) => reportsViewmodel
                    .isLoading
                ? const Center(child: CircularProgressIndicator())
                : snapshot.hasData
                    ? ReportCard(
                        key: Key(index.toString() +
                            (snapshot.data![index].name ??
                                snapshot.data![index].reportedDate.toString())),
                        report: snapshot.data![index],
                        onTap: () => reportsViewmodel.openReportDetails(
                            context, snapshot.data![index]),
                      )
                    : Center(
                        child: Text('No reports available.'),
                      ),
          ),
        ),
      ),
    );
  }
}

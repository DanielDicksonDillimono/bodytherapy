import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/reports_viewmodel.dart';
import 'package:bodytherapy/ui/main_pages/reports/widgets/report_card.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key, required this.reportsViewmodel});

  final ReportsViewmodel reportsViewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: reportsViewmodel.isLoading
            ? null
            : () => reportsViewmodel.openCreateReportPage(context),
        icon: Icon(Icons.add),
        label: Text('Create Report'),
      ),
      body: SafeArea(
        child: Container(
          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reports',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              Text(
                'View and manage reports related to your physical well-being.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // Text(
              //   "This app is not a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.",
              //   style: Theme.of(context).textTheme.bodyMedium,
              // ),
              SizedBox(height: 20),
              Expanded(
                child: StreamBuilder(
                  stream: reportsViewmodel.reportsStream,
                  builder: (context, snapshot) => ListView.builder(
                    itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                    itemBuilder: (BuildContext context, int index) =>
                        reportsViewmodel.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : snapshot.hasData && snapshot.data!.isNotEmpty
                                ? ReportCard(
                                    key: Key(index.toString() +
                                        (snapshot.data![index].name ??
                                            snapshot.data![index].reportedDate
                                                .toString())),
                                    report: snapshot.data![index],
                                    onReportTap: () {
                                      reportsViewmodel.openReportDetails(
                                          context, snapshot.data![index]);
                                    },
                                  )
                                : Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.note),
                                          SizedBox(height: 20),
                                          Text(
                                              'No reports available. Click on the button below to create a new report.'),
                                        ],
                                      ),
                                    ),
                                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

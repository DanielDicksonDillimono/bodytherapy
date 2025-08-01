import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/ui/core/loading.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/diagnosis_preview_viewmodel.dart';
import 'package:flutter/material.dart';

class DiagnosisPreviewer extends StatelessWidget {
  const DiagnosisPreviewer({
    super.key,
    required this.report,
    required this.diagnosisPreviewViewmodel,
  });

  final Report report;
  final DiagnosisPreviewViewmodel diagnosisPreviewViewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
          child: ListenableBuilder(
            listenable: diagnosisPreviewViewmodel,
            builder: (context, child) => diagnosisPreviewViewmodel.isLoading
                ? Loading()
                : Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                report.name ??
                                    'Report on ${report.reportedDate}',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              SizedBox(
                                  height:
                                      Dimens.of(context).paddingScreenVertical),
                              Text(
                                'Affected Area: ${report.affectedArea.name}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                  height:
                                      Dimens.of(context).paddingScreenVertical),
                              Text(
                                'Report Details',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(
                                  height:
                                      Dimens.of(context).paddingScreenVertical),
                              Text(
                                report.description,
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                  height:
                                      Dimens.of(context).paddingScreenVertical),
                              Text(
                                report.diagnosis ??
                                    'No interpretation available',
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Dimens.of(context).paddingScreenVertical),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            await diagnosisPreviewViewmodel.acceptDiagnosis(
                                report, context);
                          },
                          child: Text('Accept Interpretation',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

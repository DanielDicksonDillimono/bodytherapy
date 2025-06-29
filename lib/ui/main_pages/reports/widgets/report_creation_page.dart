import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/report_creation_viewmodel.dart';
import 'package:flutter/material.dart';

class ReportCreationPage extends StatelessWidget {
  ReportCreationPage({
    super.key,
    required this.createReportCallback,
    required this.reportCreationViewmodel,
  });

  final Function(BuildContext context, Report report) createReportCallback;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ReportCreationViewmodel reportCreationViewmodel;

//TODO: Applocalizations

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.of(context).edgeInsetsScreenSymmetric,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Create New Report',
                style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: Dimens.of(context).paddingScreenVertical),
            Text('Please fill in the details below to create a new report.',
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: Dimens.of(context).paddingScreenVertical),
            Text('Affected Area',
                style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: Dimens.of(context).paddingScreenVertical),
            ListenableBuilder(
              listenable: reportCreationViewmodel,
              builder: (context, _) => Wrap(
                spacing: 2,
                children: AffectedArea.values
                    .map(
                      (area) => Container(
                        width: Dimens.textCardWidth(context),
                        padding: EdgeInsets.all(4.0),
                        child: ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          tileColor:
                              reportCreationViewmodel.selectedArea == area
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.surface,
                          onTap: () {
                            reportCreationViewmodel.setSelectedArea(area);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          title: Text(
                            area.name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: Dimens.of(context).paddingScreenVertical),

            // SizedBox(
            //   height: Dimens.textCardHeight(context),
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: AffectedArea.values
            //         .map(
            //           (area) => SizedBox(
            //             width: Dimens.textCardWidth(context),
            //             child: InkWell(
            //               onTap: () {
            //                 reportsViewmodel.selectedArea = area;
            //               },
            //               child: Card(
            //                 elevation: 2,
            //                 color: area == reportsViewmodel.selectedArea
            //                     ? Theme.of(context).colorScheme.primary
            //                     : Theme.of(context).colorScheme.surface,
            //                 child: ListTile(
            //                   title: Text(
            //                     area.name,
            //                     style:
            //                         Theme.of(context).textTheme.bodyMedium,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Report Name',
                icon: Icon(Icons.title),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a report name';
                }
                return null;
              },
            ),
            SizedBox(height: Dimens.of(context).paddingScreenVertical),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                icon: Icon(Icons.description),
              ),
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  final report = Report(
                    name: nameController.text,
                    description: descriptionController.text,
                    reportedDate: DateTime.now(),
                    affectedArea: reportCreationViewmodel.selectedArea,
                  );
                  createReportCallback(context, report);
                }
              },
              child: Text('Create Report'),
            ),
          ],
        ),
      ),
    );
  }
}

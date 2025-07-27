import 'package:bodytherapy/domain/models/report_model.dart';
import 'package:bodytherapy/ui/core/loading.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/report_creation_viewmodel.dart';
import 'package:flutter/material.dart';

class ReportCreationPage extends StatelessWidget {
  const ReportCreationPage({
    super.key,
    required this.reportCreationViewmodel,
  });

  final ReportCreationViewmodel reportCreationViewmodel;

//TODO: Applocalizations

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: reportCreationViewmodel.formKey,
          child: Container(
            padding: Dimens.of(context).edgeInsetsScreenSymmetric,
            width: MediaQuery.of(context).size.width,
            child: ListenableBuilder(
              listenable: reportCreationViewmodel,
              builder: (contetx, child) => reportCreationViewmodel.isLoading
                  ? const Loading()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('Create New Report',
                              style: Theme.of(context).textTheme.headlineLarge),
                          SizedBox(
                              height: Dimens.of(context).paddingScreenVertical),
                          Text(
                              'Please fill in the details below to create a new report.',
                              style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(
                              height: Dimens.of(context).paddingScreenVertical),
                          Text('Affected Area',
                              style: Theme.of(context).textTheme.labelLarge),

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
                                        titleAlignment:
                                            ListTileTitleAlignment.center,
                                        tileColor: reportCreationViewmodel
                                                    .selectedArea ==
                                                area
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .surface,
                                        onTap: () {
                                          reportCreationViewmodel
                                              .setSelectedArea(area);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        title: Text(
                                          area.name,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                              height: Dimens.of(context).paddingScreenVertical),

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

                          SizedBox(
                              height: Dimens.of(context).paddingScreenVertical),
                          TextFormField(
                            controller:
                                reportCreationViewmodel.descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              icon: Icon(Icons.description),
                              hint: Text(
                                'Enter a brief description of the issue',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                              height: Dimens.of(context).paddingScreenVertical),
                          TextFormField(
                            controller: reportCreationViewmodel
                                .painInducingActivityController,
                            decoration: InputDecoration(
                              labelText: 'Pain Inducing Activity',
                              icon: Icon(Icons.description),
                              hint: Text(
                                'what activity causes pain or discomfort?',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                              height: Dimens.of(context).paddingScreenVertical),
                          TextFormField(
                            controller: reportCreationViewmodel
                                .priorActivityDescriptionContoller,
                            decoration: InputDecoration(
                              labelText: 'Prior Activity',
                              icon: Icon(Icons.description),
                              hint: Text(
                                'what were you doing before the issue started?',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                              height: Dimens.of(context).paddingScreenVertical),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    bottom: Dimens.of(context)
                                        .paddingScreenVertical,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimens.of(context)
                                        .paddingScreenHorizontal,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () => reportCreationViewmodel
                                        .previewReport(context),
                                    child: Text(
                                      'Get Diagnosis',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

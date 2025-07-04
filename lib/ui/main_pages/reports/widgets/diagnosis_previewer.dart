import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class DiagnosisPreviewer extends StatelessWidget {
  const DiagnosisPreviewer({
    super.key,
    required this.diagnosis,
  });

  final String diagnosis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    diagnosis,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(height: Dimens.of(context).paddingScreenVertical),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Accept Diagnosis',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

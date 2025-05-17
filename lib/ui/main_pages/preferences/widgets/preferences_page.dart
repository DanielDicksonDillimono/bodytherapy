import 'package:flutter/material.dart';
import '../view_models/preferences_model.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key, required this.preferencesModel});

  final PreferencesModel preferencesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Preferences"),
      ),
    );
  }
}

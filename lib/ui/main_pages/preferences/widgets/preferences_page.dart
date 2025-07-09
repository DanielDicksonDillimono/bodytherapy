import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import '../view_models/preferences_model.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key, required this.preferencesModel});

  final PreferencesModel preferencesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("ABOUT", style: Theme.of(context).textTheme.displayLarge),
                SizedBox(height: 20),
                Text(
                  "Body Therapy is a mobile application designed to help you manage your physical well-being. The goal is to provide you with the tools and resources you need to lead a healthier, happier life.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                GestureDetector(
                  onTap: () => preferencesModel.logout(context),
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log out'),
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

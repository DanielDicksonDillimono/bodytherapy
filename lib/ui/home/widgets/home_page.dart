import 'package:flutter/material.dart';

import '../view_models/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.viewModel});

  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Homepage"),
      ),
    );
  }
}

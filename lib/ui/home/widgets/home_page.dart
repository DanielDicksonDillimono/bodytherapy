import 'package:flutter/material.dart';

import '../view_models/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    List<String> contacts = [
      "James",
      "Name",
      "Games",
      "Fames",
      "Lames",
      "Tames"
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: screenHeight * 0.20,
            title: Text("Current prescription"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("${contacts[index]} tapped"),
                  ));
                },
                child: ListTile(
                  leading: Icon(Icons.accessibility_new_rounded),
                  title: Text(contacts[index]),
                  subtitle: Text("$index bodypart"),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                ),
              ),
              childCount: contacts.length,
            ),
          )
        ],
      ),
    );
  }
}

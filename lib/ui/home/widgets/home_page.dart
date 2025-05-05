import 'package:flutter/material.dart';

import '../view_models/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    //final double screenHeight = MediaQuery.of(context).size.height;

    ///TODO: get data Data for Homepage
    List<String> contacts = [
      "James",
      "Name",
      "Games",
      "Fames",
      "Lames",
      "Tames",
      "James",
      "Name",
      "Games",
      "Fames",
      "Lames",
      "Tames",
      "James",
      "Name",
      "Games",
      "Fames",
      "Lames",
      "Tames",
      "James",
      "Name",
      "Games",
      "Fames",
      "Lames",
      "Tames"
    ];
    return Scaffold(
      // body: CustomScrollView(
      //   slivers: [
      //     // SliverAppBar(
      //     //   pinned: true,
      //     //   floating: true,
      //     //   expandedHeight: screenHeight * 0.20,
      //     //   centerTitle: false,
      //     //   automaticallyImplyLeading: false,
      //     //   flexibleSpace: FlexibleSpaceBar(
      //     //     title: Text("Current\nPrescription"),
      //     //     centerTitle: false,
      //     //   ),
      //     // ),
      //     Column(
      //       children: [
      //         Text("Current"),
      //         Text("Prescription"),
      //       ],
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) => GestureDetector(
      //           onTap: () {
      //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //               content: Text("${contacts[index]} tapped"),
      //             ));
      //           },
      //           child: ListTile(
      //             leading: Icon(Icons.accessibility_new_rounded),
      //             title: Text(contacts[index]),
      //             subtitle: Text("$index bodypart"),
      //             trailing:
      //                 IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      //           ),
      //         ),
      //         childCount: contacts.length,
      //       ),
      //     )
      //   ],
      //),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Diagnosis",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.start,
                    ),
                    Text(""),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prescribed Exercises",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            elevation: 2,
                            shadowColor: Colors.black12,
                            child: ListTile(
                              leading: Icon(Icons.accessibility_new_rounded),
                              title: Text(contacts[index]),
                              subtitle: Text("$index bodypart"),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

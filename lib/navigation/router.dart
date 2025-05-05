import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bodytherapy/ui/exercises/view_models/exercises_viewmodel.dart';
import 'package:bodytherapy/ui/exercises/widgets/exercise_library.dart';
import 'package:bodytherapy/ui/home/view_models/home_viewmodel.dart';
import 'package:bodytherapy/ui/preferences/view_models/preferences_model.dart';
import 'package:bodytherapy/ui/preferences/widgets/preferences_page.dart';
import 'package:bodytherapy/ui/reports/view_models/reports_viewmodel.dart';
import 'package:bodytherapy/ui/reports/widgets/reports_page.dart';

import 'routes.dart';
import 'scaffold_with_bottom_nav_bar.dart';
import '../ui/home/widgets/home_page.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navShell) =>
          ScaffoldWithBottomNavBar(navigationShell: navShell),
      branches: [
        //home tab branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (BuildContext context, GoRouterState state) => HomePage(
                viewModel: HomeViewModel(
                    userRepository: context.read(),
                    reportsRepository: context.read()),
              ),
            ),
          ],
        ),

        //Reports tab branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.reports,
              builder: (BuildContext context, GoRouterState state) =>
                  ReportsPage(
                reportsViewmodel: ReportsViewmodel(),
              ),
            ),
          ],
        ),

        //Exercises tab branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.exercises,
              builder: (BuildContext context, GoRouterState state) =>
                  ExercisesPage(
                exercisesModel: ExercisesModel(),
              ),
            ),
          ],
        ),

        //Preferences tab branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settings,
              builder: (BuildContext context, GoRouterState state) =>
                  PreferencesPage(
                preferencesModel: PreferencesModel(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

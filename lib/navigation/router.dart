import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:bodytherapy/ui/sub_pages/login_signup/view_models/login_viewmodel.dart';
import 'package:bodytherapy/ui/sub_pages/login_signup/view_models/sign_up_viewmodel.dart';
import 'package:bodytherapy/ui/sub_pages/login_signup/widgets/login_page.dart';
import 'package:bodytherapy/ui/sub_pages/login_signup/widgets/password_recovery_page.dart';
import 'package:bodytherapy/ui/sub_pages/login_signup/widgets/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:bodytherapy/ui/main_pages/preferences/view_models/preferences_model.dart';
import 'package:bodytherapy/ui/main_pages/preferences/widgets/preferences_page.dart';
import 'package:bodytherapy/ui/main_pages/reports/view_models/reports_viewmodel.dart';
import 'package:bodytherapy/ui/main_pages/reports/widgets/reports_page.dart';

import 'routes.dart';
import 'scaffold_with_bottom_nav_bar.dart';

GoRouter router(UserAuthentication userAuthentication) => GoRouter(
      initialLocation: Routes.home,
      redirect: _redirect,
      refreshListenable: userAuthentication,
      routes: [
        GoRoute(
            path: Routes.login,
            builder: (context, state) {
              return LoginPage(loginViewModel: LoginViewModel(context.read()));
            }),
        GoRoute(
            path: Routes.signUp,
            builder: (context, state) {
              return SignUpPage(
                signUpViewModel:
                    SignUpViewmodel(context.read(), context.read()),
              );
            }),
        GoRoute(
            path: Routes.passwordRecovery,
            builder: (context, state) {
              return PasswordRecoveryPage(
                userAuthentication: context.read(),
              );
            }),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navShell) {
            return ScaffoldWithBottomNavBar(navigationShell: navShell);
          },
          branches: [
            //home tab branch
            // StatefulShellBranch(
            //   routes: [
            //     GoRoute(
            //       path: Routes.home,
            //       builder: (BuildContext context, GoRouterState state) =>
            //           HomePage(
            //         viewModel: HomeViewModel(
            //             reportsRepository: context.read(),
            //             userRepository: context.read()),
            //       ),
            //     ),
            //   ],
            // ),

            //Reports tab branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.home,
                  builder: (BuildContext context, GoRouterState state) =>
                      ReportsPage(
                    reportsViewmodel: ReportsViewmodel(
                      reportsRepository: context.read(),
                      userRepository: context.read(),
                    ),
                  ),
                ),
              ],
            ),

            // //Exercises tab branch
            // StatefulShellBranch(
            //   routes: [
            //     GoRoute(
            //       path: Routes.exercises,
            //       builder: (BuildContext context, GoRouterState state) =>
            //           ExerciseLibraryPage(
            //         exerciseLibraryModel: ExerciseLibraryViewModel(
            //           exerciseRepository: context.read(),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            //Preferences tab branch
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.settings,
                  builder: (BuildContext context, GoRouterState state) =>
                      PreferencesPage(
                    preferencesModel: PreferencesModel(
                        userAuthenticationService: context.read()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final bool isloggedIn =
      context.read<UserAuthentication>().currentUser() != null;

  if (!isloggedIn) {
    // return state.fullPath == Routes.signUp ? Routes.signUp : Routes.login;
    switch (state.fullPath) {
      case Routes.login:
        return Routes.login; // Already on login page
      case Routes.signUp:
        return Routes.signUp; // Redirect to sign up page
      case Routes.passwordRecovery:
        return Routes.passwordRecovery; // Redirect to password recovery page
      default:
        return Routes.login; // Default redirect to login page
    }
  }
  if (isloggedIn && state.fullPath == Routes.login) {
    return Routes.home;
  }
  return null;
}

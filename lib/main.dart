import 'package:bodytherapy/navigation/router.dart';
import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:bodytherapy/ui/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/dependencies.dart' as my_dependencies;

void main() async {
  //this is already called in runApp but done here because of Firebase initailization
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /*Lesson: 
    runApp(Widget), function in binding.dart takes the root Widget to be placed in the View.
    This is easier than creating a custom View using runWidget().
    
    Here MultiProvider is placed as the root widget i.e on top of the widget tree, in order
    to expose data that will be shared by Widget below.

    Having the MyApp class is just for readibility sake.
  */

  runApp(
    MultiProvider(
      providers: my_dependencies.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizationDelegate(),
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('nl'),
        Locale('de'),
      ],
      routerConfig: router(context.read()),
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}

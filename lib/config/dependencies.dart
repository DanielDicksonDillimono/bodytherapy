import 'package:bodytherapy/data/repositories/exercises_repository.dart';
import 'package:bodytherapy/data/services/ai_service.dart';
import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bodytherapy/data/repositories/user_repository.dart';
import 'package:bodytherapy/data/repositories/reports_repository.dart';

import 'package:bodytherapy/data/database/database_service.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
      create: (context) => UserAuthentication(FirebaseAuth.instance)),
  Provider(
    create: (context) => UserRepository(),
  ),
  Provider(
    create: (context) => ReportsRepository(
        aiService: AiService(),
        databaseService: DatabaseService(FirebaseFirestore.instance)),
  ),
  Provider(
    create: (context) => ExercisesRepository(),
  ),
  Provider(
    create: (context) => DatabaseService(FirebaseFirestore.instance),
  ),
];

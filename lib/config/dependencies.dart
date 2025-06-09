import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/repositories/user_repository.dart';
import '../data/repositories/reports_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
      create: (context) => UserAuthentication(FirebaseAuth.instance)),
  Provider(
    create: (context) => UserRepository(),
  ),
  Provider(
    create: (context) => ReportsRepository(),
  ),
  // Provider(
  //   create: (context) => S,
  // )
];

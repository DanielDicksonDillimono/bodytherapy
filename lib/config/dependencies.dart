import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/repositories/user_repository.dart';
import '../data/repositories/reports_repository.dart';

List<SingleChildWidget> providers = [
  Provider(
    create: (context) => UserRepository(),
  ),
  Provider(
    create: (context) => ReportsRepository(),
  )
];

import 'package:bodytherapy/data/database/database_service.dart';
import 'package:bodytherapy/navigation/routes.dart';
import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:flutter/material.dart';
import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:go_router/go_router.dart';

class SignUpViewmodel extends ChangeNotifier {
  SignUpViewmodel(this.userAuthentication, this.databaseService);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final UserAuthentication userAuthentication;
  final DatabaseService databaseService;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        await userAuthentication.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        if (userAuthentication.currentUser() != null) {
          final data = {
            'email': emailController.text.trim(),
            'name': nameController.text.trim(),
            'createdAt': DateTime.now().toIso8601String(),
          };
          databaseService.createUser(
              userAuthentication.currentUser()!.uid, data);
        }
      } catch (e) {
        String message = e.toString().trim();
        context.mounted ? showErrorMessage(context, message) : null;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }

  String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalization.of(context).enterValidEmail;
    }
    final emailRegex = RegExp(AppLocalization.of(context).emailRegex);
    if (!emailRegex.hasMatch(value)) {
      return AppLocalization.of(context).enterValidEmail;
    }
    return null;
  }

  void goToLoginPage(BuildContext context) {
    context.go(Routes.login);
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalization.of(context).defaultError(message)),
      ),
    );
  }
}

import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:bodytherapy/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this.userAuthenticationService);
  final UserAuthentication userAuthenticationService;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login(BuildContext context) async {
    String message;
    try {
      if (formKey.currentState?.validate() == true) {
        await userAuthenticationService.signInWithEmailAndPassword(
            emailController.text, passwordController.text);
      }
    } catch (e) {
      message = e.toString();
      context.mounted ? showErrorMessage(context, message) : null;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    notifyListeners();
  }

  void signUp(String email, String password) async {}

  void goToSignUpPage(BuildContext context) {
    context.go(Routes.signUp);
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred: $message. Please try again.'),
      ),
    );
  }
}

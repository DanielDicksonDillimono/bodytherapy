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

  Future<String?> login(String email, String password) async {
    String? message;
    try {
      if (formKey.currentState?.validate() ?? false) {
        await userAuthenticationService.signInWithEmailAndPassword(
            email, password);
        // Navigate to the home page or another page after successful login
      }
    } catch (e) {
      // Handle login error, e.g., show a snackbar or dialog
      message = e.toString();
    }
    notifyListeners();
    return message;
  }

  Future<void> logout() async {
    // Implement your logout logic here
    // For example, clear user session or token.
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    // Implement your password reset logic here
    // For example, send a password reset email.
    notifyListeners();
  }

  void signUp(String email, String password) async {}

  void goToSignUpPage(BuildContext context) {
    context.go(Routes.signUp);
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An error occurred. Please try again.'),
      ),
    );
  }
}

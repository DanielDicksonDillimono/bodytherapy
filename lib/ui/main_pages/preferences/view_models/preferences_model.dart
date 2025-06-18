import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:flutter/material.dart';

class PreferencesModel extends ChangeNotifier {
  PreferencesModel({required this.userAuthenticationService});
  final UserAuthentication userAuthenticationService;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  Future<void> logout(BuildContext context) async {
    try {
      isLoading = true;
      await userAuthenticationService.signOut();
    } catch (e) {
      showErrorMessage(context, e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    // Implement reset password logic here
    notifyListeners();
  }

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

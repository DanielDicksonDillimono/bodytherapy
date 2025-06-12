import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:flutter/material.dart';
import 'package:bodytherapy/data/services/user_authentication.dart';

class SignUpViewmodel extends ChangeNotifier {
  SignUpViewmodel(this.userAuthentication);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserAuthentication userAuthentication;

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

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalization.of(context).defaultError(message)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:bodytherapy/data/services/user_authentication.dart';

class SignUpViewmodel extends ChangeNotifier {
  SignUpViewmodel(this.userAuthentication);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserAuthentication userAuthentication;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        await userAuthentication.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } catch (e) {
        print('Sign up failed: $e');
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }
}

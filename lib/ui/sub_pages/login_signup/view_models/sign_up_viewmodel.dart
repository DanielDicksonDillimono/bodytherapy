import 'dart:io';

import 'package:bodytherapy/data/database/database_service.dart';
import 'package:bodytherapy/data/services/pdf_api.dart';
import 'package:bodytherapy/navigation/routes.dart';
import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
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
  bool termsAccepted = false;

  void setTermsAccepted(bool value) {
    termsAccepted = value;
    notifyListeners();
  }

  void openTermsAndConditions(BuildContext context) async {
    String filePath = "assets/TandC.pdf";
    File file = await PDFApi.loadAssetPDF(filePath);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Padding(
          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
          child: Column(
            children: [
              Expanded(
                child: PDFView(
                  filePath: file.path,
                  enableSwipe: true,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setTermsAccepted(true);
                  Navigator.pop(context);
                },
                child: Text(AppLocalization.of(context).iAccept),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    if (termsAccepted == false) {
      context.mounted
          ? showErrorMessage(context, AppLocalization.of(context).acceptTerms)
          : null;
      return;
    }

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
        databaseService.createUser(userAuthentication.currentUser()!.uid, data);
      }
    } catch (e) {
      String message = e.toString().trim();
      context.mounted ? showErrorMessage(context, message) : null;
    } finally {
      isLoading = false;
      notifyListeners();
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

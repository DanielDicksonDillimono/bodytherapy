import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:bodytherapy/ui/sub_pages/login_signup/view_models/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({required this.signUpViewModel, super.key});

  final SignUpViewmodel signUpViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).signUp),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: Dimens.of(context).edgeInsetsScreenSymmetric,
            child: Form(
              key: signUpViewModel.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: AppLocalization.of(context).email),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value == null || value.isEmpty
                          ? AppLocalization.of(context).enterValidEmail
                          : null),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) => value == null || value.isEmpty
                        ? "Please enter your password"
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Confirm Password"),
                    obscureText: true,
                    validator: (value) => value == null || value.isEmpty
                        ? "Please repeat your password"
                        : value != signUpViewModel.passwordController.text
                            ? "Passwords do not match"
                            : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      signUpViewModel.signUp(context);
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

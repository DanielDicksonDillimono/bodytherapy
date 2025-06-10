import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:bodytherapy/ui/core/ui_shared_elements/shared_elements.dart';
import 'package:flutter/material.dart';

import 'package:bodytherapy/ui/sub_pages/login_signup/view_models/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({required this.loginViewModel, super.key});

  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dismissKeyboard(context),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Form(
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        icon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please enter your email"
                          : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (value) => value == null || value.isEmpty
                          ? "Please enter your password"
                          : null,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle login logic
                        },
                        child: Text("Login"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child:
                              Text(AppLocalization.of(context).forgotPassword),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () =>
                                loginViewModel.goToSignUpPage(context),
                            child: Text(
                              AppLocalization.of(context).signUpMessage,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

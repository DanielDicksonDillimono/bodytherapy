import 'package:bodytherapy/ui/core/loading.dart';
import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
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
          child: ListenableBuilder(
            listenable: loginViewModel,
            builder: (context, child) => loginViewModel.isLoading
                ? const Loading()
                : Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: loginViewModel.formKey,
                        child: Container(
                          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: loginViewModel.emailController,
                                decoration: InputDecoration(
                                  labelText: AppLocalization.of(context).email,
                                  icon: Icon(Icons.email),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? AppLocalization.of(context)
                                            .enterValidEmail
                                        : null,
                              ),
                              TextFormField(
                                controller: loginViewModel.passwordController,
                                obscureText: loginViewModel.isPasswordVisible,
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalization.of(context).password,
                                  icon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      loginViewModel.isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () =>
                                        loginViewModel.toggleObscure(),
                                  ),
                                ),
                                validator: (value) => value == null ||
                                        value.isEmpty
                                    ? AppLocalization.of(context).enterPassword
                                    : null,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () =>
                                      loginViewModel.login(context),
                                  child: Text(AppLocalization.of(context)
                                      .loginButtonText),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(AppLocalization.of(context)
                                        .forgotPassword),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () => loginViewModel
                                          .goToSignUpPage(context),
                                      child: Text(
                                        AppLocalization.of(context)
                                            .signUpMessage,
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
        ),
      ),
    );
  }
}

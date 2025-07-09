import 'package:bodytherapy/ui/core/loading.dart';
import 'package:bodytherapy/ui/core/localization/applocalization.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:bodytherapy/ui/core/ui_shared_elements/shared_elements.dart';
import 'package:bodytherapy/ui/sub_pages/login_signup/view_models/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({required this.signUpViewModel, super.key});

  final SignUpViewmodel signUpViewModel;
//TODO: Applocalization- Remove hardcoded strings and use AppLocalization for all text
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dismissKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context).signUp),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              signUpViewModel.goToLoginPage(context);
            },
          ),
        ),
        body: SafeArea(
          child: ListenableBuilder(
            listenable: signUpViewModel,
            builder: (context, child) => signUpViewModel.isLoading
                ? const Loading()
                : Center(
                    child: Padding(
                      padding: Dimens.of(context).edgeInsetsScreenSymmetric,
                      child: SingleChildScrollView(
                        child: Form(
                          key: signUpViewModel.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Create Account',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Please fill in the details below to create your account.',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextFormField(
                                controller: signUpViewModel.nameController,
                                decoration: InputDecoration(
                                    labelText:
                                        AppLocalization.of(context).name),
                                validator: (value) => value == null ||
                                        value.isEmpty
                                    ? AppLocalization.of(context).enterValidName
                                    : null,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                  controller: signUpViewModel.emailController,
                                  decoration: InputDecoration(
                                      labelText:
                                          AppLocalization.of(context).email),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? AppLocalization.of(context)
                                              .enterValidEmail
                                          : null),
                              TextFormField(
                                controller: signUpViewModel.passwordController,
                                decoration:
                                    InputDecoration(labelText: "Password"),
                                obscureText: true,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? "Please enter your password"
                                        : null,
                              ),
                              TextFormField(
                                controller:
                                    signUpViewModel.confirmPasswordController,
                                decoration: InputDecoration(
                                    labelText: "Confirm Password"),
                                obscureText: true,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? "Please repeat your password"
                                        : value !=
                                                signUpViewModel
                                                    .passwordController.text
                                            ? "Passwords do not match"
                                            : null,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () => signUpViewModel
                                          .openTermsAndConditions(context),
                                      child: Text(AppLocalization.of(context)
                                          .termsConditions)),
                                  Checkbox(
                                      value: signUpViewModel.termsAccepted,
                                      onChanged: (value) {
                                        signUpViewModel
                                            .setTermsAccepted(value!);
                                      })
                                ],
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
          ),
        ),
      ),
    );
  }
}

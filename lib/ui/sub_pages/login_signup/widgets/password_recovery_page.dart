import 'package:bodytherapy/data/services/user_authentication.dart';
import 'package:bodytherapy/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatelessWidget {
  PasswordRecoveryPage({required this.userAuthentication, super.key});
  final UserAuthentication userAuthentication;

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: Dimens.of(context).edgeInsetsScreenSymmetric,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Password Recovery',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 20),
                Text(
                  'Please enter your email address to receive a password recovery link.',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await userAuthentication
                          .resetPassword(emailController.text);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error sending recovery link: $e'),
                        ),
                      );
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Recovery link sent to your email!')),
                    );
                  },
                  child: Text('Send Recovery Link'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

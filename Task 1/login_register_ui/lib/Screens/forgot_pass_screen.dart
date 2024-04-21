import 'package:flutter/material.dart';
import 'package:login_register_ui/Widgets/main_button.dart';
import 'package:login_register_ui/Widgets/main_textfield.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            MainTextField(
              width: MediaQuery.sizeOf(context).width * 0.94,
              hintText: 'Enter your email to send password recovery link',
              icon: const Icon(
                Icons.email,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            MainButton(title: 'Login'),
          ],
        ),
      ),
    );
  }
}

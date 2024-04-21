import 'package:flutter/material.dart';
import 'package:login_register_ui/Screens/forgot_pass_screen.dart';
import 'package:login_register_ui/Widgets/main_button.dart';
import 'package:login_register_ui/Widgets/main_textfield.dart';
import 'package:login_register_ui/Screens/register_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.09,
            ),
            Center(
              child: Image.network(
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  'https://hadibuttt.github.io/GDSC-Portfolio-Site/img/gdsc-numl-logo.png'),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            const Center(
                child: Text(
              'Welcome to GDSC-NUML!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            MainTextField(
              width: MediaQuery.sizeOf(context).width * 0.94,
              hintText: 'Enter your email address',
              icon: const Icon(
                Icons.email,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            MainTextField(
              width: MediaQuery.sizeOf(context).width * 0.94,
              hintText: 'Enter your password',
              icon: const Icon(
                Icons.lock,
                color: Colors.orange,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(PageTransition(
                    child: const ForgotPassScreen(),
                    type: PageTransitionType.rightToLeft));
              },
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            MainButton(title: 'Send mail'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New here? '),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        PageTransition(
                            child: const RegisterScreen(),
                            type: PageTransitionType.rightToLeft)),
                    child: const Text(
                      'Register yourself',
                      style: TextStyle(color: Colors.orange),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

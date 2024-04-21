import 'package:flutter/material.dart';
import 'package:login_register_ui/Widgets/main_button.dart';
import 'package:login_register_ui/Widgets/main_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 55,
                  child: Icon(Icons.edit),
                ),
              ),
              const Center(child: Text('Upload Picture')),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
              ),
              MainTextField(
                width: MediaQuery.sizeOf(context).width * 0.94,
                hintText: 'Enter your name',
                icon: const Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
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
                hintText: 'Create password',
                icon: const Icon(
                  Icons.lock,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              MainTextField(
                width: MediaQuery.sizeOf(context).width * 0.94,
                hintText: 'Confirm password',
                icon: const Icon(
                  Icons.lock,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              MainTextField(
                width: MediaQuery.sizeOf(context).width * 0.94,
                hintText: 'Gender',
                icon: const Icon(
                  Icons.person,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              MainButton(title: 'Register'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_filed.dart';
import '../widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Todo
  void _submitForm() {
    if (formKey.currentState!.validate()) {
      print('验证成功！开始注册...');

      print('Email: ${emailController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),

        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login In.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              CustomField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 15),
              CustomField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                onPressed: _submitForm,
                buttonText: 'Login in',
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account?  ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        color: Pallete.gradient3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:client/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'features/auth/view/pages/signup_page.dart';
import 'features/auth/view/pages/login_page.dart';
import './core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      routes: {
        '/': (context) => const LoginPage(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.signup: (context) => SignupPage(),
      },
      initialRoute: '/',
    );
  }
}


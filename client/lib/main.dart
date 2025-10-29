import 'package:client/core/router/app_router.dart';
import 'package:client/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'features/auth/view/pages/signup_page.dart';
import 'features/auth/view/pages/login_page.dart';
import './core/theme/theme.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,

      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: AppRoutes.login, page: () => LoginPage()),
        GetPage(name: AppRoutes.signup, page: () => SignupPage()),
        GetPage(name: AppRoutes.home, page: () => Home()),
        GetPage(name: AppRoutes.other, page: () => Other()),
      ],
      initialRoute: AppRoutes.login,
    );
  }
}

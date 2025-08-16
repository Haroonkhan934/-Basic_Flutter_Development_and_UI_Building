// File: lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'auth_view_model.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (_) => AuthViewModel(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Week 1 Login App & Signup',
              initialRoute: '/',
              routes: {
                '/': (context) => const LoginScreen(),
                '/signup': (context) => const SignUpScreen(),
                '/forgot-password': (context) => const ForgotPasswordScreen(),
                '/home': (context) => const HomeScreen(),
              },
            ),
          );
          },
        );
    }
}

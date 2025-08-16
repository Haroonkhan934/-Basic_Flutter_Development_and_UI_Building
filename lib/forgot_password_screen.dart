// File: lib/forgot_password_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'auth_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _resetPassword(AuthViewModel auth) async {
    if (_formKey.currentState!.validate()) {
      await auth.forgotPassword(emailController.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password reset link sent!")),
        );
        Navigator.pop(context); // Go back to Login
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password", style: TextStyle(fontSize: 18.sp)),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Enter your email to reset password",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 20.h),

                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),

                  // Reset Button
                  ElevatedButton(
                    onPressed: auth.isLoading ? null : () => _resetPassword(auth),
                    child: auth.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text("Send Reset Link", style: TextStyle(fontSize: 16.sp)),
                  ),
                ],
              ),
            ),
            ),
        );
    }
}

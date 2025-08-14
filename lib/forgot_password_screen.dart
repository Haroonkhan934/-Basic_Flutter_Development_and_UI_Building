import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: Text("Forgot Password", style: TextStyle(fontSize: 18.sp))),
        body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Text("Enter your email to reset password", style: TextStyle(fontSize: 16.sp)),
                SizedBox(height: 20.h),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Password reset link sent!")),
                    );
                  },
                  child: Text("Send Reset Link", style: TextStyle(fontSize: 16.sp)),
                ),
              ],
            ),
            ),
        );
    }
}

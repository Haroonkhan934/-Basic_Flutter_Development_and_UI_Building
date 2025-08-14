import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home", style: TextStyle(fontSize: 18.sp))),
        body: Center(
            child: Text(
              "Welcome to Home Screen",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            ),
        );
    }
}

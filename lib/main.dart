import 'package:flutter/material.dart';
import 'package:tony/components/NavBar.dart';
import 'package:tony/pages/HomePage.dart';
import 'package:tony/pages/onboarding/LoginPage.dart';
import 'package:tony/pages/onboarding/OTPPage.dart';
import 'package:tony/pages/onboarding/NamePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBar(
          pageIndex: 0,
        ));
  }
}

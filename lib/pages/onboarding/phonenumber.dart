import 'package:flutter/material.dart';
import 'package:tony/utils/phonefield.dart';

class phoneNumberPage extends StatefulWidget {
  const phoneNumberPage({super.key});

  @override
  State<phoneNumberPage> createState() => _phoneNumberPageState();
}

class _phoneNumberPageState extends State<phoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text("Introdu numarul de telefon"),
              SizedBox(
                height: 20,
              ),
              phoneField(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tony/components/NextButton.dart';
import 'package:tony/components/PhoneField.dart';
import 'package:tony/pages/onboarding/OTPPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/bg.jpg",
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                                "Bine ai venit"),
                            Text(
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                                "la Tony's"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        style: TextStyle(fontSize: 15),
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
                    const SizedBox(
                      height: 30,
                    ),
                    const phoneField(),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OTPPage()),
                        );
                      },
                      child: const NextButton(
                        text: "Sa incepem",
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Prin continuare esti de acord cu termenii si conditiile."),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:tony/env/env.dart';
import 'package:tony/pages/onboarding/NamePage.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Scrie codul primit",
                    style: TextStyle(fontSize: 30, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Scrie codul de 4 cifre trimis la +4012345678",
                    style: TextStyle(fontSize: 15, fontFamily: 'UberMove'),
                  ),
                  const Text(
                    "Nu ai primit codul? Trimite din nou",
                    style: TextStyle(fontSize: 15, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OTPTextField(
                    length: 4,
                    width: 400,
                    fieldWidth: 20,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: $pin");
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NamePage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: tonyOrange,
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Center(
                        child: Text(
                      'Continuă',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'UberMove',
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

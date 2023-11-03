import 'package:flutter/material.dart';
import 'package:tony/components/TextFieldBoxOTP.dart';
import 'package:tony/env/env.dart';
import 'package:tony/pages/HomePage.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController controller = TextEditingController();
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
                    "Introdu prenumele tau",
                    style: TextStyle(fontSize: 30, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Il vom folosi pentru a sti cum sa te salutam!",
                    style: TextStyle(fontSize: 15, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldBoxOTP(
                      controller: controller, keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
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

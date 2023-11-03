import 'package:flutter/material.dart';

import '../../components/NextButton.dart';
import '../../components/PhoneField.dart';
import '../../pages/onboarding/OTPPage.dart';

import 'package:provider/provider.dart';
import '../../providers/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneFieldController = TextEditingController();

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
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'UberMove'),
                                "Bine ai venit"),
                            Text(
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'UberMove'),
                                "la Tony's"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        style: TextStyle(fontSize: 15, fontFamily: 'UberMove'),
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
                    const SizedBox(
                      height: 30,
                    ),
                    PhoneField(
                      controller: phoneFieldController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        var user = Provider.of<User>(context, listen: false);
                        String phone = '0${phoneFieldController.text}';

                        await user.checkUser(phone);

                        if (user.check == true) {
                          await user.loginPhone(phone);
                        } else if (user.check == false) {
                          await user.signupPhone(phone);
                        }

                        if (user.errorMessage == '') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OTPPage()),
                          );
                        }
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
                      "Prin continuare esti de acord cu termenii si conditiile.",
                      style: TextStyle(fontFamily: 'UberMove'),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

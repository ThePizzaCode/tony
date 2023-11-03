import 'package:flutter/material.dart';
import 'package:tony/env/env.dart';
import 'package:tony/pages/onboarding/PhoneNumberPage.dart';

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
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/bg.jpg"), // Use AssetImage to load the image
                      fit: BoxFit
                          .cover, // You can set the fit property as needed
                    ),
                  ),
                ),
                // Image.asset(
                //   "assets/images/bg.jpg",
                // ),
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
                          style:
                              TextStyle(fontSize: 18, fontFamily: 'UberMove'),
                          "Câștigă puncte cu fiecare achizitie și răsfață-te cu oferte exclusive, cadouri și multe altele. Începeți să sorbiți și să câștigați astăzi!"),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PhoneNumberPage()),
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
      ),
    );
  }
}

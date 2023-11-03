import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tony/pages/onboarding/OTPPage.dart';
import '../../components/NavBar.dart';
import '../../components/TextFieldBoxOTP.dart';
import '../../env/env.dart';
import '../../providers/user.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  TextEditingController phoneFieldController = TextEditingController();
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
                    "Introdu numarul tau de telefon",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Iti vom trimite un SMS cu un cod de activare.",
                    style: TextStyle(fontSize: 15, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldBoxOTP(
                      controller: phoneFieldController,
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 30,
                  ),
                ],
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
                      MaterialPageRoute(builder: (context) => const OTPPage()),
                    );
                  }
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

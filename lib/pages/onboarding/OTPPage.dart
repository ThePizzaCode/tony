import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../components/NavBar.dart';
import '../../pages/onboarding/NamePage.dart';

import 'package:provider/provider.dart';
import '../../providers/user.dart';
import '../../providers/wallet.dart';

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
              Consumer<User>(builder: (context, user, child) {
                return Column(
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
                    Text(
                      "Scrie codul de 4 cifre trimis la +4${user.phoneNumber}",
                      style:
                          const TextStyle(fontSize: 15, fontFamily: 'UberMove'),
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
                      onCompleted: (code) async {
                        final user = Provider.of<User>(context, listen: false);
                        final wallet =
                            Provider.of<Wallet>(context, listen: false);

                        if (user.check) {
                          await user.loginCode(code);
                          wallet.getBalance(user.token);

                          if (user.errorMessage == '') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NavBar(pageIndex: 0),
                                ));
                          }
                        } else {
                          await user.signupCode(code);

                          if (user.errorMessage == '') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NamePage(),
                                ));
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

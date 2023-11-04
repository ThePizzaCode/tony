import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/NavBar.dart';
import '../../components/TextFieldBoxOTP.dart';
import '../../env/env.dart';
import '../../providers/user.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController nameController = TextEditingController();
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
                    "Introdu prenumele tău",
                    style: TextStyle(fontSize: 30, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Il vom folosi pentru a ști cum să te salutăm :)",
                    style: TextStyle(fontSize: 15, fontFamily: 'UberMove'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldBoxOTP(
                      controller: nameController,
                      keyboardType: TextInputType.name),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  final user = Provider.of<User>(context, listen: false);

                  await user.signupUsername(nameController.text);

                  if (user.errorMessage == '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavBar(
                                pageIndex: 0,
                              )),
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

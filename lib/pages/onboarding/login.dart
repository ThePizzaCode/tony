import 'package:flutter/material.dart';
import 'package:tony/utils/loginBttn.dart';
import 'package:tony/utils/phonefield.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                    Row(
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        style: TextStyle(fontSize: 15),
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
                    SizedBox(
                      height: 30,
                    ),
                    phoneField(),
                    SizedBox(
                      height: 10,
                    ),
                    loginBttn(
                      text: "Sa incepem",
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Prin continuare esti de acord cu termenii si conditiile."),
                    SizedBox(
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

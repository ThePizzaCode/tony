import 'package:flutter/material.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController controller;
  const PhoneField({required this.controller, super.key});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          keyboardType: TextInputType.phone,
          //must add controller
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 22, fontFamily: 'UberMove'),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/flag.png",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "+40 ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'UberMove'),
                  ),
                ],
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                  color: Colors.grey), // Set focused border color
            ),
            hoverColor: Colors.grey, // Set hover color
            filled: false,
          ),
        ),
      ],
    );
  }
}

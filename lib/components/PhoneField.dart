import 'package:flutter/material.dart';

class phoneField extends StatefulWidget {
  const phoneField({super.key});

  @override
  State<phoneField> createState() => _phoneFieldState();
}

class _phoneFieldState extends State<phoneField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          //must add controller
          cursorColor: Colors.black,
          style: const TextStyle(
            fontSize: 22,
          ),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 15),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              borderSide:
                  const BorderSide(color: Colors.grey), // Set focused border color
            ),
            hoverColor: Colors.grey, // Set hover color
            filled: false,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class loginBttn extends StatelessWidget {
  final String text;
  final Color color;
  const loginBttn({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        text),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final String text;
  final Color color;
  const NextButton({super.key, required this.text, required this.color});

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
                  color: color, borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        style: const TextStyle(color: Colors.white, fontSize: 18),
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

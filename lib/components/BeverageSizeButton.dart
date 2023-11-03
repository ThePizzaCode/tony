// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BeverageSizeButton extends StatelessWidget {
  final String size;
  final bool selected;
  const BeverageSizeButton({
    required this.size,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double side = 45;
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        height: side,
        width: side,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: selected ? Colors.amber : Colors.grey),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selected
                    ? Colors.white
                    : const Color.fromARGB(255, 58, 58, 58)),
          ),
        ),
      ),
    );
  }
}

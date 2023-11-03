// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tony/env/env.dart';

class MenuFilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuFilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: isSelected ? tonyOrange : lightGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'UberMove',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

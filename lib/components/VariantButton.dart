import 'package:flutter/material.dart';
import 'package:tony/env/env.dart';

class VariantButton extends StatelessWidget {
  final String variant;
  final int price;

  const VariantButton({required this.variant, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 35,
      decoration: BoxDecoration(
          color: lightGrey, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              variant,
              style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'UberMove',
                  fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  '+${price.toString()}',
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'UberMove',
                      fontWeight: FontWeight.w500),
                ),
                const Icon(
                  Icons.star_rounded,
                  color: tonyOrange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

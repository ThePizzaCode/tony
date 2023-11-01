import 'package:flutter/material.dart';
import 'package:tony/env/env.dart';

class VariantButton extends StatelessWidget {
  const VariantButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 35,
        decoration: BoxDecoration(
            color: lightGrey, borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mediu',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'UberMove',
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Text(
                    '+500',
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'UberMove',
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: tonyOrange,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

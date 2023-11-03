import 'package:flutter/material.dart';
import 'package:tony/env/env.dart';

class OptionElement extends StatelessWidget {
  final String name;
  const OptionElement({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'UberMove',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Irish Cream',
                  style: TextStyle(
                    fontFamily: 'UberMove',
                    fontSize: 20,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tony/env/env.dart';
import 'package:tony/models/product_model.dart';

class OptionElement extends StatelessWidget {
  final String name;
  final List<OptionModel> options;
  const OptionElement({
    required this.options,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options.isNotEmpty
          ? [
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
                child: MediaQuery.removePadding(
                  removeTop: true,
                  removeBottom: true,
                  context: context,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          options[index].option,
                          style: const TextStyle(
                            fontFamily: 'UberMove',
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ]
          : [],
    );
  }
}

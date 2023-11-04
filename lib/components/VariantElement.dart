import 'package:flutter/material.dart';
import '../components/VariantButton.dart';
import '../models/product_model.dart';

class VariantElement extends StatelessWidget {
  final String name;
  final List<VariantModel> variants;
  const VariantElement({
    required this.variants,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: variants.isNotEmpty
          ? [
              const SizedBox(height: 20),
              const Text(
                'Mărimi',
                style: TextStyle(
                  fontFamily: 'UberMove',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: variants.length,
                  itemBuilder: (context, index) {
                    if (index == 1 && variants.length == 2) {
                      return VariantButton(
                        variant: variants[index].variant,
                        price: variants[index].price,
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: VariantButton(
                          variant: variants[index].variant,
                          price: variants[index].price,
                        ),
                      );
                    }
                  },
                ),
              ),
            ]
          : [],
    );
  }
}

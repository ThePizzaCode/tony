import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tony/components/OptionElement.dart';
import 'package:tony/components/VariantButton.dart';
import 'package:tony/components/VariantElement.dart';
import 'package:tony/pages/onboarding/LoginPage.dart';
import '../../providers/products.dart';

class CustomizeDrink {
  static void show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(9),
          topRight: Radius.circular(9),
        ),
      ),
      builder: (BuildContext context) {
        // Schedule the focus request after the bottom sheet is built

        return Consumer<Products>(builder: (context, products, child) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.transparent,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personalizeaza',
                    style: TextStyle(
                        fontFamily: "UberMove",
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  VariantElement(
                      variants: products.product.variants['marime'] ?? [],
                      name: 'Mărimi'),
                  const SizedBox(height: 20),
                  OptionElement(
                      name: 'Arome',
                      options: products.product.options['aroma'] ?? [])
                ],
              ),
            ),
          );
        });
      },
    );
  }
}

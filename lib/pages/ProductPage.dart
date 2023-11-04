import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/VariantElement.dart';
import '../components/OptionElement.dart';
// import '../components/VariantButton.dart';
import '../utils/url.dart';
import '../env/env.dart';

import '../providers/products.dart';
import '../providers/user.dart';

class ProductPage extends StatefulWidget {
  final String productID;
  const ProductPage({required this.productID, super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final products = Provider.of<Products>(context, listen: false);

      products.getProduct(widget.productID);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(builder: (context, products, child) {
      return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Consumer<User>(builder: (context, user, child) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              getProductImageURL(widget.productID, user.token),
                              scale: 1),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.product.title,
                          style: const TextStyle(
                            fontFamily: 'UberMove',
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              products.product.price.toString(),
                              style: const TextStyle(
                                fontFamily: 'UberMove',
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: tonyOrange,
                              ),
                            ),
                            const Icon(
                              Icons.star_rounded,
                              color: tonyOrange,
                              size: 25,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          products.product.desc,
                          style: const TextStyle(
                            fontFamily: 'UberMove',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
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
                ],
              ),
            ),
            Positioned(
              left: 20, // Adjust the position as needed
              top: 10, // Adjust the position as needed
              child: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

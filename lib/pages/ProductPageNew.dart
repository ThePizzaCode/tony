import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tony/components/modals/customize_drink.dart';
import '../components/VariantElement.dart';
import '../components/OptionElement.dart';
// import '../components/VariantButton.dart';
import '../utils/url.dart';
import '../env/env.dart';

import '../providers/products.dart';
import '../providers/user.dart';

class ProductPageNew extends StatefulWidget {
  final String productID;
  const ProductPageNew({required this.productID, super.key});

  @override
  State<ProductPageNew> createState() => _ProductPageNewState();
}

class _ProductPageNewState extends State<ProductPageNew> {
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    CustomizeDrink.show(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        border: Border.all(
                                            width: 1, color: darkGrey)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3, bottom: 3, left: 8),
                                      child: Row(children: [
                                        Text(
                                          'Personalizeaza',
                                          style: TextStyle(
                                              fontFamily: 'UberMove',
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 80, 80, 80)),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: tonyOrange,
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      border: Border.all(
                                          width: 1, color: darkGrey)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 8),
                                    child: Row(children: [
                                      Text(
                                        'Cant.',
                                        style: TextStyle(
                                            fontFamily: 'UberMove',
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromARGB(
                                                255, 80, 80, 80)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontFamily: 'UberMove',
                                            fontWeight: FontWeight.w700,
                                            color: tonyOrange),
                                      ),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: tonyOrange,
                              ),
                              child: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: tonyOrange,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Text(
                                'Comanda 1 pentru 500',
                                style: TextStyle(
                                  fontFamily: 'UberMove',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        )
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

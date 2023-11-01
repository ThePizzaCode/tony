import 'package:flutter/material.dart';
import 'package:tony/pages/ProductPage.dart';

class ProductPreview extends StatelessWidget {
  final String title;
  final String? description;
  final AssetImage? image;
  final String price;
  const ProductPreview(
      {required this.title,
      this.description,
      this.image,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/product1.jpg'),
                          fit: BoxFit.cover,
                        )),
                    height: 115,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'UberMove'),
                      ),
                      const Text(
                        "Cafeaua noastra espresso, echilibrata de lapte si acoperita cu un strat fin de spuma.",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'UberMove'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.orange,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'UberMove'),
                  ),
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

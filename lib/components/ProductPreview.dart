import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cafeaua noastra espresso, echilibrata de lapte si acoperita cu un strat fin de spuma.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      price,
                      style: TextStyle(fontSize: 14, color: Colors.orange),
                    ),
                    Icon(
                      Icons.star,
                      size: 14,
                      color: Colors.orange,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

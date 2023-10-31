import 'package:flutter/material.dart';
import 'package:tony/components/BeverageSizeButton.dart';

class ProductPageTest extends StatefulWidget {
  const ProductPageTest({super.key});

  @override
  State<ProductPageTest> createState() => _ProductPageTestState();
}

class _ProductPageTestState extends State<ProductPageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg.jpg'),
                          fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Latte Machiato",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Vezi arome",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Savor the perfect blend of espresso and creamy, steamed milk in our Latte Macchiato, a harmonious and irresistible coffee delight.",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 80, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                "lei",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BeverageSizeButton(
                              size: "S",
                              selected: true,
                            ),
                            BeverageSizeButton(
                              size: "M",
                              selected: false,
                            ),
                            BeverageSizeButton(
                              size: "L",
                              selected: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

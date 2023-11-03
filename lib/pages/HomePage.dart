import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:tony/components/ProductPreview.dart';
import 'package:tony/providers/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    "Cardul tau de fidelitate",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'UberMove',
                    ),
                  ),
                  Text(
                    "Scaneaza inainte de plata ca sa te bucuri de reduceri instant și acumulează puncte de fidelitate.",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w700,
                        fontFamily: 'UberMove'),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: SfBarcodeGenerator(
                  value: "111111",
                  showValue: true,
                  symbology: Code128(),
                  textStyle: const TextStyle(
                      letterSpacing: 10,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'UberMove'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final childAspectRatio = MediaQuery.of(context).size.width / (2 * 350);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                // Wrap the Column with SingleChildScrollView
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<User>(builder: (context, user, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Buna ${user.user.username}!',
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'UberMove',
                            ),
                          ),
                          const Row(
                            children: [
                              Text(
                                "450",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'UberMove',
                                  color: Colors.orange,
                                ),
                              ),
                              Icon(Icons.star, color: Colors.orange),
                            ],
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 20),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink[200],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Recomandate pentru tine",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'UberMove',
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Add the grid here
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: childAspectRatio,
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scrolling within GridView
                      children: const [
                        // Add your grid items here
                        ProductPreview(title: "Cafe Late", price: "500"),
                        ProductPreview(title: "Late Machiato", price: "2000"),
                        ProductPreview(title: "Cafe Late", price: "500"),
                        ProductPreview(title: "Cafe Late", price: "500"),
                        ProductPreview(title: "Cafe Late", price: "500"),
                        // Add more grid items as needed
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _openBottomSheet(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.orange,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // Center content horizontally
                          children: [
                            Icon(Icons.credit_card),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Fidelitate",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'UberMove',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

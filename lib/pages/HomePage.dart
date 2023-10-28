import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:tony/components/ProductPreview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.3, // Adjust this factor as needed
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Cardul tau de fidelitate",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Scaneaza inainte de plata ca sa te bucuri de reduceri instant și acumulează puncte de fidelitate.",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: SfBarcodeGenerator(
                    value: "77714564576",
                    showValue: true,
                    symbology: Code128(),
                    textStyle: TextStyle(letterSpacing: 10, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Buna Gabriel!",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "450",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          Icon(Icons.star, color: Colors.orange),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink[200],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Recomandate pentru tine",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),

                  // Add the grid here
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio:
                          0.62, // You can adjust this ratio as needed
                      shrinkWrap: true,
                      children: [
                        // Add your grid items here
                        ProductPreview(title: "Cafe Late", price: "500"),
                        ProductPreview(title: "Late Machiato", price: "2000"),
                        ProductPreview(title: "Cafe Late", price: "500"),
                        ProductPreview(title: "Cafe Late", price: "500"),
                        ProductPreview(title: "Cafe Late", price: "500"),
                        // Add more grid items as needed
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                                  fontSize: 16, fontWeight: FontWeight.bold),
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

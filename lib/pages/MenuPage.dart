import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:tony/components/ProductPreview.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: SfBarcodeGenerator(
                    value: "77714564576",
                    showValue: true,
                    symbology: Code128(),
                    textStyle: TextStyle(
                        letterSpacing: 10,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'UberMove'),
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
                  Text(
                    "Meniu",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'UberMove'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Text('Populare'),
                        Text('Cafea'),
                        Text('Mancare'),
                        Text('Bauturi'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

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
            ],
          ),
        ),
      ),
    );
  }
}

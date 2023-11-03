import 'package:flutter/material.dart';
import 'package:tony/components/MenuFilterButton.dart';
import 'package:tony/components/ProductPreview.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedFilter = "Populare"; // Default filter

  void setFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define your grid items based on the selected filter
    List<Widget> gridItems = [
      const ProductPreview(
        title: "Cafe Late",
        price: "500",
      ),
      const ProductPreview(title: "Late Machiato", price: "2000"),
      const ProductPreview(title: "Sandwich", price: "500"),
      const ProductPreview(title: "Clatite", price: "500"),
      const ProductPreview(title: "Hell", price: "500"),
      // Your grid items here
    ];

    if (selectedFilter == "Populare") {
      // Filter based on the "Populare" filter
      gridItems = [
        const ProductPreview(title: "Cafe Late", price: "500"),
        const ProductPreview(title: "Late Machiato", price: "2000"),
        const ProductPreview(title: "Sandwich", price: "500"),
        const ProductPreview(title: "Clatite", price: "500"),
        const ProductPreview(title: "Hell", price: "500"),
      ];
    } else if (selectedFilter == "Mancare") {
      // Filter based on the "Mancare" filter
      gridItems = [
        const ProductPreview(title: "Sandwich", price: "500"),
        const ProductPreview(title: "Clatite", price: "500"),
      ];
    } else if (selectedFilter == "Cafea") {
      // Filter based on the "Cafea" filter
      gridItems = [
        const ProductPreview(title: "Cafe Late", price: "500"),
        const ProductPreview(title: "Late Machiato", price: "2000"),
      ];
    } else if (selectedFilter == "Bauturi") {
      // Filter based on the "Bauturi" filter
      gridItems = [
        const ProductPreview(title: "Hell", price: "500"),
      ];
    }

    final childAspectRatio = MediaQuery.of(context).size.width / (2 * 350);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Meniu",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'UberMove'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        MenuFilterButton(
                          text: "Populare",
                          isSelected: selectedFilter == "Populare",
                          onTap: () => setFilter("Populare"),
                        ),
                        MenuFilterButton(
                          text: "Mancare",
                          isSelected: selectedFilter == "Mancare",
                          onTap: () => setFilter("Mancare"),
                        ),
                        MenuFilterButton(
                          text: "Cafea",
                          isSelected: selectedFilter == "Cafea",
                          onTap: () => setFilter("Cafea"),
                        ),
                        MenuFilterButton(
                          text: "Bauturi",
                          isSelected: selectedFilter == "Bauturi",
                          onTap: () => setFilter("Bauturi"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Add the grid here
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio:
                          childAspectRatio, // You can adjust this ratio as needed

                      children: gridItems,
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

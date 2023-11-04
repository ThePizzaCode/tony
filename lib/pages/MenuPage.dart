import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tony/components/MenuFilterButton.dart';
import 'package:tony/components/ProductPreview.dart';

import '../providers/products.dart';
import '../providers/user.dart';

import '../utils/url.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String selectedFilter = "rec"; // Default filter

  void setFilter(String filter) {
    final products = Provider.of<Products>(context, listen: false);
    products.sortProductsTag(filter);
    setState(() {
      selectedFilter = filter;
    });
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
                          isSelected: selectedFilter == "rec",
                          onTap: () => setFilter("rec"),
                        ),
                        MenuFilterButton(
                          text: "Cafea",
                          isSelected: selectedFilter == "cafea",
                          onTap: () => setFilter("cafea"),
                        ),
                        MenuFilterButton(
                          text: "Băuturi",
                          isSelected: selectedFilter == "suc",
                          onTap: () => setFilter("suc"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Add the grid here
                  Consumer<User>(builder: (context, user, child) {
                    return Consumer<Products>(
                        builder: (context, products, child) {
                      return Expanded(
                        child: GridView.count(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio:
                              childAspectRatio, // You can adjust this ratio as needed

                          children: (products.sortedProducts)
                              .map((sp) => ProductPreview(
                                  productID: sp.id,
                                  title: sp.title,
                                  desc: sp.desc,
                                  price: sp.price.toString(),
                                  image: getProductImageURL(sp.id, user.token)))
                              .toList(),
                        ),
                      );
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

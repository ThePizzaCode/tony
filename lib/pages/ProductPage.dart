import 'package:flutter/material.dart';
import 'package:tony/components/OptionElement.dart';
import 'package:tony/components/VariantButton.dart';
import 'package:tony/env/env.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemCounter = 3;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          // Photo section (half the screen)
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/product1.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            },
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
          // Bottom sheet section
          DraggableScrollableSheet(
            initialChildSize: .40,
            minChildSize: .40,
            maxChildSize: .65,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Latte Machiatto",
                              style: TextStyle(
                                fontFamily: 'UberMove',
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Text(
                                  '500',
                                  style: TextStyle(
                                    fontFamily: 'UberMove',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: tonyOrange,
                                  ),
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: tonyOrange,
                                  size: 25,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Savor the perfect blend of espresso and creamy, steamed milk in our Latte Macchiato, a harmonious and irresistible coffee delight.',
                              style: TextStyle(
                                fontFamily: 'UberMove',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Alege marime',
                              style: TextStyle(
                                fontFamily: 'UberMove',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(),
                                itemCount: itemCounter,
                                itemBuilder: (context, index) {
                                  if (index == 1 && itemCounter == 2) {
                                    return const VariantButton();
                                  } else {
                                    return const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: VariantButton(),
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            const OptionElement(
                              name: 'Arome Disponibile',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

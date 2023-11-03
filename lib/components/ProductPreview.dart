import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tony/env/env.dart';
import 'package:tony/pages/ProductPage.dart';
import 'package:tony/providers/user.dart';
import 'package:tony/utils/url.dart';

class ProductPreview extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  final String price;
  const ProductPreview(
      {required this.title,
      required this.desc,

      ///Placeholder, delete before deploy
      required this.image,
      required this.price,
      super.key});

  @override
  Widget build(BuildContext context) {
    String shortenedDescription = desc;
    if (desc.length > maxLenghtProductPreviewDescription) {
      shortenedDescription =
          '${desc.substring(0, maxLenghtProductPreviewDescription)}...';
    }

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
                Consumer<User>(builder: (context, user, child) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: image != ''
                                ? NetworkImage(image)
                                : NetworkImage(
                                    getProductImageURL('0', user.token)),
                            fit: BoxFit.cover,
                          )),
                      height: 115,
                    ),
                  );
                }),
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
                      Text(
                        shortenedDescription,
                        style: const TextStyle(
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

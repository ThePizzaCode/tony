import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionPreview extends StatelessWidget {
  final DateTime date;
  final int noOfProducts;
  final int price;
  TransactionPreview({
    required this.date,
    required this.noOfProducts,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMMM').format(date);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontFamily: 'UberMove',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '$noOfProducts ${noOfProducts == 1 ? 'produs' : 'produse'}',
                  style: TextStyle(
                    fontFamily: 'UberMove',
                    color: Color(0xFF737373),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  price.toString(),
                  style: TextStyle(
                      fontFamily: 'UberMove',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_rounded,
                  size: 15,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class TransactionPreview extends StatelessWidget {
  final String date;
  final int price;

  const TransactionPreview({
    required this.date,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat('dd MMMM').format(date);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontFamily: 'UberMove',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+$price',
                      style: const TextStyle(
                          fontFamily: 'UberMove',
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 15,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

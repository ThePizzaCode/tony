import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tony/components/TransactionPreview.dart';

import '../providers/transactions.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              const Text(
                'Listă tranzacții',
                style: TextStyle(
                    fontFamily: 'UberMove',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<Transactions>(builder: (context, transactions, child) {
                return transactions.transactions.isEmpty
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(
                              'Nu există date de afișat',
                              style: TextStyle(
                                  fontFamily: 'UberMove',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: transactions.transactions.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      TransactionPreview(
                                        price: transactions
                                            .transactions[index].value,
                                        date: transactions
                                            .transactions[index].date,
                                      ),
                                      if (index <
                                          transactions.transactions.length - 1)
                                        const Divider(
                                          color: Color(0xFFCCCCCC),
                                        ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

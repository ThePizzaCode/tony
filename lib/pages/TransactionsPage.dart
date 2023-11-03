import 'package:flutter/material.dart';
import 'package:tony/components/TransactionPreview.dart';

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
                'Lista Tranzactii',
                style: TextStyle(
                    fontFamily: 'UberMove',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    TransactionPreview(
                      price: 1000,
                      date: 'now',
                    ),
                    Divider(
                      color: Color(0xFFCCCCCC),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

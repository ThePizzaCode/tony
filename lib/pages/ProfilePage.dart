import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/TransactionPreview.dart';
import '../pages/TransactionsPage.dart';
import '../pages/onboarding/LoginPage.dart';

import '../providers/user.dart';
import '../providers/wallet.dart';
import '../providers/transactions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final user = Provider.of<User>(context, listen: false);
      final transactions = Provider.of<Transactions>(context, listen: false);
      final wallet = Provider.of<Wallet>(context, listen: false);

      await wallet.getBalance(user.token);
      await transactions.getTransactions(user.token);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Wallet>(builder: (context, wallet, child) {
      return Consumer<User>(builder: (context, user, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.user.username,
                    style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'UberMove',
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        wallet.balance.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'UberMove',
                            color: Colors.orange),
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Tranzactii recente',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'UberMove',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<Transactions>(
                      builder: (context, transactions, child) {
                    return transactions.transactions.isEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Center(
                                child: Text(
                                  'Nu exista date de afisat',
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        transactions.transactions.length > 3
                                            ? 4
                                            : transactions.transactions.length,
                                    itemBuilder: (context, index) {
                                      if (index == 3) {
                                        return Center(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TransactionsPage()),
                                            );
                                          },
                                          child: Text(
                                            'Arata mai multe',
                                            style: TextStyle(
                                                color: Colors.blue[700],
                                                fontFamily: 'UberMove',
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ));
                                      } else {
                                        return Column(
                                          children: [
                                            TransactionPreview(
                                              price: transactions
                                                  .transactions[index].value,
                                              date: transactions
                                                  .transactions[index].date,
                                            ),
                                            if (index <
                                                transactions
                                                        .transactions.length -
                                                    1)
                                              const Divider(
                                                color: Color(0xFFCCCCCC),
                                              ),
                                          ],
                                        );
                                      }
                                    }),
                              ),
                            ),
                          );
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      final user = Provider.of<User>(context, listen: false);
                      user.logout();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Deconectare',
                              style: TextStyle(
                                  fontFamily: 'UberMove',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}

import 'package:flutter/material.dart';
import 'package:tony/components/TransactionPreview.dart';

class ProfilePage extends StatefulWidget {
  final List<String> pastTransactions;
  const ProfilePage({
    required this.pastTransactions,
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gabriel Stanciu',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'UberMove',
                    fontWeight: FontWeight.w700),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '450',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'UberMove',
                        color: Colors.orange),
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.orange,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Tranzactii recente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'UberMove',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              widget.pastTransactions.isEmpty
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
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
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget.pastTransactions.length > 3
                                  ? 4
                                  : widget.pastTransactions.length,
                              itemBuilder: (context, index) {
                                if (index == 3) {
                                  return Center(
                                      child: Text(
                                    'Arata mai multe',
                                    style: TextStyle(
                                        color: Colors.blue[700],
                                        fontFamily: 'UberMove',
                                        fontWeight: FontWeight.w500),
                                  ));
                                } else {
                                  return Column(
                                    children: [
                                      TransactionPreview(
                                        price: 1000,
                                        noOfProducts: 1,
                                        date: DateTime.now(),
                                      ),
                                      if (index <
                                          widget.pastTransactions.length - 1)
                                        Divider(
                                          color: Color(0xFFCCCCCC),
                                        ),
                                    ],
                                  );
                                }
                              }),
                        ),
                      ),
                    ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
                        'Delogheaza-te',
                        style: TextStyle(
                            fontFamily: 'UberMove',
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

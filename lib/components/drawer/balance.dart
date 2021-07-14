import 'package:flutter/material.dart';

import '../../helpers/themes/themes.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        color: white,
        child: ExpansionTile(
          title: Row(
            children: [
              Text(
                'Balance: ',
                style: tsColorBoldSize(16.0),
              ),
              Spacer(),
              Text(
                '1000.00',
                style: TextStyle(
                  fontSize: 26.0,
                  color: kSeceonndaryColor,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          children: [
            BalanceTile(
              title: 'TopUp Balance:         ',
              balance: '3867.00',
            ),
            BalanceTile(
              title: 'Affiliate Balance:       ',
              balance: '320.00',
            ),
            BalanceTile(
              title: 'CashBack Balance:   ',
              balance: '180.00',
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceTile extends StatelessWidget {
  final String title, balance;

  const BalanceTile({Key? key, required this.title, required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: tsBoldSize(12.0),
          ),
          Text(
            balance,
            style: tsColorEBoldSize(18.0),
          )
        ],
      ),
    );
  }
}
